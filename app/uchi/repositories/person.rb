# frozen_string_literal: true

module Uchi
  module Repositories
    class Person < Repository
      def fields
        [
          Field::Id.new(:id),
          Field::String.new(:first_name),
          Field::String.new(:last_names),
          Field::HasMany.new(:companies)
        ]
      end

      def title(record)
        "#{record.first_name} #{record.last_names}"
      end
    end
  end
end
