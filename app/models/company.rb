class Company < ApplicationRecord
  has_one_attached :logo

  has_many :phone_numbers, as: :owner, dependent: :destroy

  has_many :roles, dependent: :destroy
  has_many :people, through: :roles
  has_many :projects, dependent: :destroy
  has_and_belongs_to_many :tags

  validates :name, presence: true
end
