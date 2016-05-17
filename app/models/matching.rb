class Matching < ActiveRecord::Base
  has_many :matching_queues
  enum queue_type: { ranked: 0, normal: 1, aram: 2}

  def add_role_point(matching_queue)
    if(matching_queue.secondary_role == MatchingQueue.none_secondary)
      primary_point = 2
    else
      primary_point = 1
    end
    add_point_to_single_role(matching_queue.primary_role, primary_point)
    if(primary_point == 1)
      add_point_to_single_role(matching_queue.secondary_role, primary_point)
    end

    self.save
  end

  def add_point_to_single_role(role, point)
    case role.to_sym
    when :top_primary, :top_secondary then
      self.top_point = self.top_point + point
    when :mid_primary, :mid_secondary then
      self.mid_point = self.mid_point + point
    when :bot_primary, :bot_secondary then
      self.bot_point = self.bot_point + point
    when :support_primary, :support_secondary then
      self.sup_point = self.sup_point + point
    when :jungle_primary, :jungle_secondary then
      self.jg_point = self.jg_point + point
    end
  end
end
