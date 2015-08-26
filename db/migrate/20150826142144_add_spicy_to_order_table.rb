class AddSpicyToOrderTable < ActiveRecord::Migration
  def change
    add_column :order_tables, :spicy, :string
  end
end
