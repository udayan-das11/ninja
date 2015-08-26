class AddMenuTitleToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :menuTitle, :string
  end
end
