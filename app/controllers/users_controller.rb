class UsersController < ApplicationController

  before_action :set_team, only: [:show]

	def show
		
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
