class CreateUnifiedexams < ActiveRecord::Migration
  def change
    create_table :unifiedexams do |t|
      t.boolean :original
      t.string :year
      t.string :number
      t.string :russian
      t.string :math
      t.string :social_science
      t.string :physics

      t.timestamps null: false
    end
  end
end
