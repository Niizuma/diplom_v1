class CreateEtypes < ActiveRecord::Migration
  def change
    create_table :etypes do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
