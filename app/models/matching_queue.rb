class MatchingQueue < ActiveRecord::Base
  enum primary_role: { fill_primary: 0, bot_primary: 1, support_primary: 2, mid_primary: 3, top_primary: 4, jungle_primary: 5}
  enum secondary_role: { fill_secondary: 0, bot_secondary: 1, support_secondary: 2, mid_secondary: 3, top_secondary: 4, jungle_secondary: 5}
  belongs_to :user
  belongs_to :matching

  validate :queue_num_cannot_be_more_then_five, :user_dont_have_matching

  def queue_num_cannot_be_more_then_five
    if matching.matching_queues.size >= 5
      errors.add(:excess_num, "queue is full!")
    end
  end

  def user_dont_have_matching
    if user.matching_queue
      errors.add(:already_in_queue, "already in queue!")
    end
  end
end
