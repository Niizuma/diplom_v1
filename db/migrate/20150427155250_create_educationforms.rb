class CreateEducationforms < ActiveRecord::Migration
  def change
    create_table :educationforms do |t|
      #t.boolean :full_time
      #t.boolean :correspondence
      #t.boolean :part_time
      t.integer  :state
      #t.integer :financingform_id
      
      t.timestamps null: false
    end
  end
end
