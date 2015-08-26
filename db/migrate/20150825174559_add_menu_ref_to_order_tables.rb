class AddMenuRefToOrderTables < ActiveRecord::Migration
  def change
    add_reference :order_tables, :menu, index: true, foreign_key: true
  end
end
