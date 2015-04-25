class CreateIdentifyDocs < ActiveRecord::Migration
  def change
    create_table :identifies do |t|
      t.boolean :original
      t.integer :type_id
      t.string :country
      t.string :series
      t.string :number
      t.string :unit
      t.date :where
      t.string :issued_by
      t.date :birthday

      t.timestamps null: false
    end
  end
end
