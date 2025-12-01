class CreateRoles < ActiveRecord::Migration[8.1]
  def change
    create_table :roles do |t|
      t.belongs_to :company, null: false, foreign_key: true
      t.belongs_to :person, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
