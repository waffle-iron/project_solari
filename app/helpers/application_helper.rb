module ApplicationHelper
  def getChampionImageTagById(image_url, id)
    client = Taric.client(region: :jp)
    champion = client.static_champion(id: id, champ_data_option: "image")
    image_tag image_url + "/img/champion/" + champion.body["image"]["full"]
  end

  def getSummonerSpellImageTagById(image_url, id)
    client = Taric.client(region: :jp)
    summonerSpell = client.static_summoner_spell(id: id, spell_data_option: "image")
    image_tag image_url + "/img/spell/" + summonerSpell.body["image"]["full"]
  end

  def getItemImageTagById(image_url, id)
    if id == nil
      return
    end
    client = Taric.client(region: :jp)
    item = client.static_item(id: id, item_data_option: "image")
    image_tag image_url + "/img/item/" + item.body["image"]["full"]
  end

  def getMatchHistoryLink(game_id, summoner_id)
    return "http://matchhistory.jp.leagueoflegends.com/ja/#match-details/JP1/" + game_id.to_s + "/" + summoner_id.to_s + "?tab=overview"
  end
end
