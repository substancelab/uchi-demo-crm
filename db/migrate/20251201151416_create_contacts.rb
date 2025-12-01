class CreateContacts < ActiveRecord::Migration[8.1]
  def change
    create_table :contacts do |t|
      t.belongs_to :lead, null: false, foreign_key: true
      t.references :contactable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
