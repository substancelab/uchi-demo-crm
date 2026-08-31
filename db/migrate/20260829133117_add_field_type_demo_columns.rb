class AddFieldTypeDemoColumns < ActiveRecord::Migration[8.1]
  def change
    add_column :companies, :employees_count, :integer
    add_column :companies, :active, :boolean, default: true, null: false

    create_table :tags do |t|
      t.string :name, null: false

      t.timestamps
    end

    create_join_table :companies, :tags do |t|
      t.index [ :company_id, :tag_id ]
    end
  end
end
