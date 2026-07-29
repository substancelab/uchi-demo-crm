class AddTitleToPerson < ActiveRecord::Migration[8.1]
  def change
    add_column :people, :title, :string
  end
end
