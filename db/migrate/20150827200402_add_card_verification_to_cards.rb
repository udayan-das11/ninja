class AddCardVerificationToCards < ActiveRecord::Migration
  def change
    add_column :cards, :card_verification, :string
  end
end
