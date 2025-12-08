class Person < ApplicationRecord
  has_many :roles, dependent: :destroy
  has_many :companies, through: :roles

  def name
    "#{first_name} #{last_names}"
  end
end
