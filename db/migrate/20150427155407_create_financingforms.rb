class CreateFinancingforms < ActiveRecord::Migration
  def change
    create_table :financingforms do |t|
      t.boolean :budget
      t.boolean :paid
      t.boolean :paid_budg
      t.integer :educationform_id
      t.timestamps null: false
    end
  end
end
