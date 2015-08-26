class AddGuestsToOrderTable < ActiveRecord::Migration
  def change
    add_column :order_tables, :number_of_guests, :integer
  end
end
