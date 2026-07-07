# frozen_string_literal: true

module Uchi
  module Repositories
    class Person < Repository
      def fields
        [
          Field::Id.new(:id),
          Field::Select.new(:title).options([ "Mr.", "Ms.", "Dr.", "Prof.", "" ]),
          Field::String.new(:first_name).on(:edit, :new),
          Field::String.new(:last_names).on(:edit, :new),
          Field::HasMany.new(:companies),

          Field::HasMany.new(:phone_numbers),

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
