class Matching < ActiveRecord::Base
  has_many :matching_queues
  enum queue_type: { ranked: 0, normal: 1, aram: 2}

  def get_member_array
    result = []
    (1..5).each{|num|
      result.push(MatchingQueue.new({
      :summoner_name => eval("self.member" + num.to_s + "_summoner_name"),
      :top => eval("self.member" + num.to_s + "_top"),
      :mid => eval("self.member" + num.to_s + "_mid"),
      :bot => eval("self.member" + num.to_s + "_bot"),
      :sup => eval("self.member" + num.to_s + "_sup"),
      :jg => eval("self.member" + num.to_s + "_jg"),
      :token => eval("self.member" + num.to_s + "_token"),
      :rank => eval("self.member" + num.to_s + "_rank")
      }))
    }
    puts result
    return result
  end

  def add_member(matching_queue)
    num = get_open_member
    eval("self.member" + num.to_s + "_summoner_name = matching_queue.summoner_name")
    eval("self.member" + num.to_s + "_top = matching_queue.top")
    eval("self.member" + num.to_s + "_mid = matching_queue.mid")
    eval("self.member" + num.to_s + "_bot = matching_queue.bot")
    eval("self.member" + num.to_s + "_sup = matching_queue.sup")
    eval("self.member" + num.to_s + "_jg = matching_queue.jg")
    eval("self.member" + num.to_s + "_token = " + num.to_s)
    eval("self.member" + num.to_s + "_rank = nil")
    self.save
    #番号、トークン
    # TODO トークンを返す
    return num, num.to_s
  end

  def get_open_member
    (1..5).each{|num|
      if !eval("member" + num.to_s + "_summoner_name")
        return num
      end
    }
    return nil
  end

  #ロールをトークンを用いて設定
  #番号とサモナー名を返す
  def set_role_with_token(token: nil, top: 0, mid: 0, bot: 0, sup: 0, jg: 0)
    (1..5).each{|num|
      if eval("member" + num.to_s + "_token == token")
        eval("self.member" + num.to_s + "_top = top")
        eval("self.member" + num.to_s + "_mid = mid")
        eval("self.member" + num.to_s + "_bot = bot")
        eval("self.member" + num.to_s + "_sup = sup")
        eval("self.member" + num.to_s + "_jg = jg")
        self.save
        return num, eval("self.member" + num.to_s + "_summoner_name")
      end
    }
  end

  def exit_room(token)
    (1..5).each{|num|
      if eval("member" + num.to_s + "_token == token")
        eval("self.member" + num.to_s + "_summoner_name = nil")
        eval("self.member" + num.to_s + "_token = nil")
        eval("self.member" + num.to_s + "_rank = nil")
        self.save
        return num
      end
    }
  end

end
