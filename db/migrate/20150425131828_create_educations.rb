class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.boolean :original
      t.string :series
      t.string :number
      t.date :where
      t.string :university
      t.integer :etype_id
      t.timestamps null: false
    end
  end
end
