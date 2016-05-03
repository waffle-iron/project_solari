class Matching < ActiveRecord::Base
  has_many :matching_queues
  enum queue_type: { ranked: 0, normal: 1, aram: 2}
end
