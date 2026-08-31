# frozen_string_literal: true

module Uchi
  module Repositories
    class Person < Repository
      def fields
        [
          Field::Id.new(:id),
          Field::Select.new(:title).options([ "Mr.", "Ms.", "Dr.", "Prof.", "" ]),

          Field::String.new(:name)
            .on(:index, :show)
            .searchable(lambda { |query, term|
              query.where("CONCAT(first_name, ' ', last_names) LIKE ?", "%#{term}%")
            })
            .sortable(lambda { |query, direction|
              query.order(first_name: direction, last_names: direction)
            }),
          Field::String.new(:first_name).on(:edit, :new),
          Field::String.new(:last_names).on(:edit, :new),
          Field::Blank.new(:spacer).on(:edit, :new),

          Field::HasMany.new(:companies),
          Field::HasMany.new(:roles).searchable(lambda { |query, term|
            query
            .joins(:roles)
            .where("roles.title LIKE ?", "%#{term}%")
            .distinct
          }),
          Field::HasMany.new(:phone_numbers)
        ]
      end

      def title(record)
        record.name
      end
    end
  end
end
