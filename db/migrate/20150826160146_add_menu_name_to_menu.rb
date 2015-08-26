class AddMenuNameToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :menuName, :string
  end
end
