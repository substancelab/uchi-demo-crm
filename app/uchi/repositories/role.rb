# frozen_string_literal: true

module Uchi
  module Repositories
    class Role < Repository
      def fields
        [
          Field::BelongsTo.new(:person)
            .sortable(lambda { |query, direction|
              query.joins(:person).order(person: { first_name: direction, last_names: direction })
            }),
          Field::String.new(:title),
          Field::BelongsTo.new(:company)
            .sortable(lambda { |query, direction|
              query.joins(:company).order(company: { name: direction })
            })
        ]
      end
    end
  end
end
