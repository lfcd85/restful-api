class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title, limit: 100
      t.string :making_time, limit: 100
      t.string :serves, limit: 100
      t.string :ingredients, limit: 300
      t.integer :cost

      t.timestamps
    end
  end
end
