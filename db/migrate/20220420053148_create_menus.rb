class CreateMenus < ActiveRecord::Migration[7.0]
  def change
    create_table :menus do |t|
      t.string :name
      t.text :description
      t.float :price
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
