class UsersController < ApplicationController

  before_action :set_team, only: [:show, :refresh]

	def show
    client = Taric.client(region: :jp)
    userName = @user.summoner_name
    data = client.summoners_by_names(summoner_names: userName)
    @summonerInfo = data.body[userName]
		@games = @user.games.order("create_date DESC")
	end

  def refresh
    if @user.match_updated_at
      lastMin = ((Time.now - @user.match_updated_at) / 60).to_i
      if lastMin < 30
        redirect_to @user, notice: lastMin.to_s + "分前に更新したばかりです！あと" + (30 - lastMin).to_s + "分待ってください！"
        return
      end
    end

    unlock_achievements, refresh_count = @user.refresh_match_history
    @user.match_updated_at = Time.now
    @user.save

    #TODO return proper message(API error, no new match found, new achievement unlock etc...)
    if unlock_achievements
      flash[:unlock] = unlock_achievements
    end
    if refresh_count > 0
      redirect_to @user, notice: 'match mistory updated'
    else
      redirect_to @user, notice: 'no new data found'
    end

  end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:user).permit(:user_name)
    end

end
