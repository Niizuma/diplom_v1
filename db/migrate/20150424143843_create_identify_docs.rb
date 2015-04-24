class CreateIdentifyDocs < ActiveRecord::Migration
  def change
    create_table :identifies do |t|
      t.string :series
      t.integer :type_id
      t.string :number
      t.date :where
      t.string :country
      t.timestamps null: false
    end
  end
end
