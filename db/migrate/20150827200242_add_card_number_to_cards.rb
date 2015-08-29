class AddCardNumberToCards < ActiveRecord::Migration
  def change
    add_column :cards, :card_number, :string
  end
end
