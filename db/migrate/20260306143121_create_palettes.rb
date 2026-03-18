class CreatePalettes < ActiveRecord::Migration[8.0]
  def change
    create_table :palettes do |t|
      t.string :name
      t.json :lasso_points
      t.references :user, null: false, foreign_key: true
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
