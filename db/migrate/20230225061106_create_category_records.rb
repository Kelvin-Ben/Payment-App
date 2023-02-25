class CreateCategoryRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :category_records do |t|

      t.timestamps
    end
  end
end
