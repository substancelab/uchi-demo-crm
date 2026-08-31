class Project < ApplicationRecord
  belongs_to :company

  has_one_attached :contract

  validates :name, presence: true
end
