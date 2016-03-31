class HomeController < ApplicationController

	def index
      client = Taric.client(region: :jp)
      userName = current_user.summoner_name
      data = client.summoners_by_names(summoner_names: userName)
      @summonerInfo = data.body[userName]
	end

end
