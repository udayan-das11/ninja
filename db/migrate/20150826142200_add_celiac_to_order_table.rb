class AddCeliacToOrderTable < ActiveRecord::Migration
  def change
    add_column :order_tables, :celiac, :string
  end
end
