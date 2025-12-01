class Contact < ApplicationRecord
  belongs_to :lead
  belongs_to :contactable, polymorphic: true
end
