class MenuAttachment < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :menu

end
