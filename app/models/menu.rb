class Menu < ActiveRecord::Base
  belongs_to :Host
  has_many :menu_attachments
end
