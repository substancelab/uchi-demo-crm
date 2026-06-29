# frozen_string_literal: true

module Uchi
  module Repositories
    class PhoneNumber < Repository
      def fields
        [
          Field::Id.new(:id),
          Field::BelongsTo.new(:owner),
          Field::String.new(:number)
        ]
      end

      def title(record)
        record.number
      end
    end
  end
end
