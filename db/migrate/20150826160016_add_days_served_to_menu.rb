class AddDaysServedToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :daysServed, :string
  end
end
