class CreatePersonaldocs < ActiveRecord::Migration
  def change
    create_table :personaldocs do |t|
      t.string :first_name
      t.string :second_name
      t.string :third_name
      t.integer :gender_id
      t.string :special_rights
      t.string :сп_возврата
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
