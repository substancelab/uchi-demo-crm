class CreatePhoneNumbers < ActiveRecord::Migration[8.1]
  def change
    create_table :phone_numbers do |t|
      t.belongs_to :owner, polymorphic: true, null: false
      t.string :number, null: false
      t.string :verification_code
      t.datetime :verified_at
      t.string :status

      t.timestamps
    end
  end
end
