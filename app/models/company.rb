class Company < ApplicationRecord
  has_one_attached :logo

  has_many :roles
  has_many :people, through: :roles

  validates :name, presence: true
end
