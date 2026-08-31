# frozen_string_literal: true

module Uchi
  module Repositories
    class PhoneNumber < Repository
      def fields
        [
          Field::Id.new(:id),
          Field::BelongsTo.new(:owner).sortable(false),
          Field::String.new(:number).searchable(lambda { |query, term|
            term = term.tr(" ().-", "")
            query.where("REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(number, ' ', ''), '-', ''), '(', ''), ')', ''), '.', '') LIKE ?", "%#{term}%")
          }),
          Field::DateTime.new(:verified_at)
        ]
      end

      def title(record)
        record.number
      end
    end
  end
end
