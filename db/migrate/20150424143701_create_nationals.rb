class CreateNationals < ActiveRecord::Migration
  def change
    create_table :nationals do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
