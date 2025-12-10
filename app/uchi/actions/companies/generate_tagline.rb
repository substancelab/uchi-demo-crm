module Uchi
  module Actions
    module Companies
      class GenerateTagline < Uchi::Action
        def name
          "Set a new tagline"
        end

        def perform(records, inputs = {})
          records.each do |company|
            company.update(tagline: Faker::Company.catch_phrase)
          end

          ActionResponse.success("Tagline has been changed")
        end
      end
    end
  end
end
