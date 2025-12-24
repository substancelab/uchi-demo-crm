class Company < ApplicationRecord
  has_one_attached :logo

  has_many :roles, dependent: :destroy
  has_many :people, through: :roles
  has_many :projects, dependent: :destroy

  validates :name, presence: true
end
