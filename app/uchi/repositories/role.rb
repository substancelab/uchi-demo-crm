# frozen_string_literal: true

module Uchi
  module Repositories
    class Role < Repository
      def fields
        [
          Field::BelongsTo.new(:person)
            .collection_query(lambda { |query|
              query.reorder(:first_name, :last_names)
            })
            .sortable(lambda { |query, direction|
              query.joins(:person).order(person: { first_name: direction, last_names: direction })
            }),
          Field::String.new(:title),
          Field::BelongsTo.new(:company)
            .collection_query(lambda { |query|
              query.reorder(:name)
            })
            .sortable(lambda { |query, direction|
              query.joins(:company).order(company: { name: direction })
            })
        ]
      end
    end
  end
end
