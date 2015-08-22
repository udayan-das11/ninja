class MenuAttachment < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :menu
  accepts_nested_attributes_for :menu_attachments
end
