class MatchingQueue

  include ActiveModel::Model

  # Formで使用するプロパティを定義する
  attr_accessor :summoner_name, :top, :mid, :bot, :sup, :jg, :token, :rank, :is_owner

end
