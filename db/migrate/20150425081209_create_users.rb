class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :second_name
      t.string :third_name
      t.integer :gender_id
      t.string :special_rights
      t.string :сп_возврата

      t.timestamps null: false
    end
  end
end
