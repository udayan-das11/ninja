class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :menuType
      t.string :experience
      t.references :Host, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
