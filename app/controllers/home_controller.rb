class HomeController < ApplicationController

	def index
      client = Taric.client(region: :na)
      userName = "javasparrow"
      data = client.summoners_by_names(summoner_names: userName)
      p data.body
      @summonerId = data.body[userName]["id"]
      @summonerLevel = data.body[userName]["summonerLevel"]
#      {"javasparrow"=>{"id"=>58430999, "name"=>"Javasparrow", "profileIconId"=>28, "summonerLevel"=>22, "revisionDate"=>1427650868000}}
	end

end
