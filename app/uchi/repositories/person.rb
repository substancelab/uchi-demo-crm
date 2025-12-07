# frozen_string_literal: true

module Uchi
  module Repositories
    class Person < Repository
      def fields
        [
          Field::Id.new(:id),
          Field::String.new(:first_name).on(:edit, :new),
          Field::String.new(:last_names).on(:edit, :new),
          Field::HasMany.new(:companies),

          Field::String.new(:name)
            .on(:index, :show)
            .searchable(false)
            .sortable(lambda { |query, direction|
              query.order(first_name: direction, last_names: direction)
            })
        ]
      end

      def title(record)
        record.name
      end
    end
  end
end
