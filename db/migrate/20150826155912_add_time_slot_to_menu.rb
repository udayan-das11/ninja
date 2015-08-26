class AddTimeSlotToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :timeSlot, :string
  end
end
