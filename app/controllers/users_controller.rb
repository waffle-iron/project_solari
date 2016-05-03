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

    @user.refresh_match_history

    #TODO return proper message(API error, no new match found, new achievement unlock etc...)
    if true
      redirect_to @user, notice: 'Match history successfully updated.'
    else
      redirect_to @user, notice: 'Error!'
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
