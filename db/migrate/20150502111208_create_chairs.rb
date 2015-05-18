class CreateChairs < ActiveRecord::Migration
  def change
    create_table :chairs do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
