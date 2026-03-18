class CreateColors < ActiveRecord::Migration[8.0]
  def change
    create_table :colors do |t|
      t.string :hex_code
      t.string :name
      t.text :description
      t.float :percentage
      t.references :palette, null: false, foreign_key: true

      t.timestamps
    end
  end
end
