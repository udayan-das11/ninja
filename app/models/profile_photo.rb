class ProfilePhoto < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :host
end
