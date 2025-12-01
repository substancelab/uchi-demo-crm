class CreateLeads < ActiveRecord::Migration[8.1]
  def change
    create_table :leads do |t|
      t.string :state
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
