class CreateOrderTables < ActiveRecord::Migration
  def change
    create_table :order_tables do |t|
      t.string :date
      t.string :timeslotfrom
      t.string :timeslotto
      t.string :customization
      t.string :status
      t.string :paymentid
      t.references :Host, index: true, foreign_key: true
      t.references :User, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
