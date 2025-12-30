# frozen_string_literal: true

module Uchi
  module Repositories
    class Company < Repository
      def actions
        [
          Uchi::Actions::Companies::GenerateTagline.new
        ]
      end

      def fields
        [
          Field::Id.new(:id),
          Field::String.new(:name),
          Field::String.new(:tagline),
          Field::Image.new(:logo),
          Field::HasMany.new(:people),
          Field::HasMany.new(:projects)
        ]
      end
    end
  end
end
