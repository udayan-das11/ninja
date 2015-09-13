class Host < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable, :omniauth_providers => [:facebook]

  has_many :post_attachments
  accepts_nested_attributes_for :post_attachments
  has_many :menus

  def self.from_omniauth(auth)
    puts(auth.to_json)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |host|
      host.email = auth.info.email
      host.password = Devise.friendly_token[0,20]
      host.username = auth.info.name   # assuming the user model has a name
      host.skip_confirmation!
    end
  end


end
