module ApplicationHelper
  def getChampionImageTagById(id)
    image_tag "championImage/" + id.to_s + ".png"
  end

  def getSummonerSpellImageTagById(id)
    image_tag "summonerspellImage/" + id.to_s + ".png"
  end

  def getItemImageTagById(id)
    if id == nil
      return
    end
    image_tag "itemImage/" + id.to_s + ".png"
  end

  def getMatchHistoryLink(game_id, summoner_id)
    return "http://matchhistory.jp.leagueoflegends.com/ja/#match-details/JP1/" + game_id.to_s + "/" + summoner_id.to_s + "?tab=overview"
  end
end
