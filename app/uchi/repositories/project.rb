# frozen_string_literal: true

module Uchi
  module Repositories
    class Project < Repository
      def default_sort_order
        SortOrder.new(:name, :asc)
      end

      def fields
        [
          Field::Id.new(:id),
          Field::BelongsTo.new(:company),
          Field::String.new(:name),
          Field::Date.new(:starts_on),
          Field::Date.new(:ends_on)
        ]
      end
    end
  end
end
