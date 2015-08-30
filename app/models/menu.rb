class Menu < ActiveRecord::Base
  belongs_to :Host
  has_many :menu_attachments
  has_many :items
  accepts_nested_attributes_for :items
end
