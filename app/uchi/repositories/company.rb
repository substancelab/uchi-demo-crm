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
          Field::Select.new(:industry)
            .options(
              {
                "Industry": {
                  consumer_services: "Consumer Services",
                  financials: "Financials",
                  telecommunications: "Telecommunications"
                },
                "Mining": [
                  "Gas Distribution",
                  "Specialty Retailers"
                ]
              }
            ),
          Field::Number.new(:employees_count),
          Field::Boolean.new(:active),
          Field::HasAndBelongsToMany.new(:tags),
          Field::HasMany.new(:people),
          Field::HasMany.new(:projects),
          Field::HasMany.new(:phone_numbers)
        ]
      end
    end
  end
end
