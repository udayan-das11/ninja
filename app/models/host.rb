class Host < ActiveRecord::Base

  has_many :post_attachments
  accepts_nested_attributes_for :post_attachments

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
