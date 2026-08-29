# frozen_string_literal: true

module Uchi
  module Repositories
    class Lead < Repository
      def fields
        [
          Field::Id.new(:id),
          Field::String.new(:name),
          Field::Select.new(:state).options(%w[new contacted qualified won lost]),
          Field::Text.new(:description)
        ]
      end
    end
  end
end
