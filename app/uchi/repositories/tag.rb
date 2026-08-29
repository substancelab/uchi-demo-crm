# frozen_string_literal: true

module Uchi
  module Repositories
    class Tag < Repository
      def fields
        [
          Field::Id.new(:id),
          Field::String.new(:name),
          Field::HasAndBelongsToMany.new(:companies)
        ]
      end
    end
  end
end
