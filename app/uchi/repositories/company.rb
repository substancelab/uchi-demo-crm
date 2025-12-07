# frozen_string_literal: true

module Uchi
  module Repositories
    class Company < Repository
      def fields
        [
          Field::Id.new(:id),
          Field::String.new(:name),
          Field::String.new(:tagline),
          Field::Image.new(:logo)
        ]
      end
    end
  end
end
