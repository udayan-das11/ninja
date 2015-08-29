class UpdateCard < ActiveRecord::Migration
  def change
    add_column :cards, :payment_id, :Integer
    remove_column :cards, :order_table_id
  end
end
