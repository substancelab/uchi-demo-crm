class AddForeignKeysAndUniqueIndexToCompaniesTags < ActiveRecord::Migration[8.1]
  def change
    remove_index :companies_tags, [ :company_id, :tag_id ]
    add_index :companies_tags, [ :company_id, :tag_id ], unique: true

    add_foreign_key :companies_tags, :companies
    add_foreign_key :companies_tags, :tags
  end
end
