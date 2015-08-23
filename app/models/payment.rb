
class Payment < ActiveRecord::Base
  belongs_to :order_table
  has_one :card
  accepts_nested_attributes_for :card

end