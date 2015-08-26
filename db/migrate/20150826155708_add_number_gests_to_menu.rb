class AddNumberGestsToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :numberGuests, :string
  end
end
