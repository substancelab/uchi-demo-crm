class AddIndustryToCompany < ActiveRecord::Migration[8.1]
  def change
    add_column :companies, :industry, :string
  end
end
