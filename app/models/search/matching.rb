class Search::Matching < Search::Base
  ATTRIBUTES = %i(
  queue_type under30 unranked bronze silver gold
  plutinum diamond master challenger role_primary role_secondary
  )

  attr_accessor(*ATTRIBUTES)

  def matches
    t = ::Matching.arel_table
    results = ::Matching.all
    print queue_type

    results = results.where(queue_type: Matching.queue_types[queue_type]) if queue_type.present?
    results = results.where(under30: true) if ActiveRecord::Type::Boolean.new.type_cast_from_database(under30)
    results = results.where(unranked: true) if ActiveRecord::Type::Boolean.new.type_cast_from_database(unranked)
    results = results.where(bronze: true) if ActiveRecord::Type::Boolean.new.type_cast_from_database(bronze)
    results = results.where(silver: true) if ActiveRecord::Type::Boolean.new.type_cast_from_database(silver)
    results = results.where(gold: true) if ActiveRecord::Type::Boolean.new.type_cast_from_database(gold)
    results = results.where(plutinum: true) if ActiveRecord::Type::Boolean.new.type_cast_from_database(plutinum)
    results = results.where(diamond: true) if ActiveRecord::Type::Boolean.new.type_cast_from_database(diamond)
    results = results.where(master: true) if ActiveRecord::Type::Boolean.new.type_cast_from_database(master)
    results = results.where(challenger: true) if ActiveRecord::Type::Boolean.new.type_cast_from_database(challenger)
    results
  end
end
