class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.string :name
      t.decimal :amount
      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
