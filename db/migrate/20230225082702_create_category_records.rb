class CreateCategoryRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :category_records do |t|
      t.belongs_to :category, null: false, foreign_key: true
      t.belongs_to :record, null: false, foreign_key: true
      t.timestamps
    end
  end
end
