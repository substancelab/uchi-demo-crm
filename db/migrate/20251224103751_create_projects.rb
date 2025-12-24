class CreateProjects < ActiveRecord::Migration[8.1]
  def change
    create_table :projects do |t|
      t.belongs_to :company, null: false, foreign_key: true
      t.string :name
      t.string :state
      t.date :starts_on
      t.date :ends_on

      t.timestamps
    end
  end
end
