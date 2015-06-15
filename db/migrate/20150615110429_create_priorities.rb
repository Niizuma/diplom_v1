class CreatePriorities < ActiveRecord::Migration
  def change
    create_table :priorities do |t|
      t.string :first
      t.string :second
      t.string :third
      t.integer :specialization_id

      t.timestamps null: false
    end
  end
end
