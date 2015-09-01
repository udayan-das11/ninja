class Host < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :post_attachments
  accepts_nested_attributes_for :post_attachments
  has_many :menus
  def self.omniauth(auth)
    puts('########################')
    where(auth.slice(:emailid)).first_or_initialize.tap do |host|
      host.username = auth.info.name
      host.emailid = auth.info.email
	     host.provider = 'facebook'
	     host.uuid = auth.uid
      host.save!
    end
  end
end
