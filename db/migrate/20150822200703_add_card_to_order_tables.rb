class AddCardToOrderTables < ActiveRecord::Migration
  def change

    create_table :payments do |t|
      t.references :order_table, index: true
      t.string :full_name
      t.string :company
      t.string :email
      t.string :telephone
      t.timestamps
      t.text :notification_params
      t.string :status
      t.string :transaction_id
      t.datetime :purchased_at
    end

  end
end
