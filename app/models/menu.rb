class Menu < ActiveRecord::Base
  belongs_to :Host
  has_many :menu_attachments
  has_many :items
  has_one :profile_photo
  has_one :cover_photo
  accepts_nested_attributes_for :items
  accepts_nested_attributes_for :menu_attachments
end
