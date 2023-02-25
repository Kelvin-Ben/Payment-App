class CreateSplashes < ActiveRecord::Migration[7.0]
  def change
    create_table :splashes do |t|

      t.timestamps
    end
  end
end
