class MailToGuest < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mail_to_guest.accept.subject
  #
  def accept(menuid,date,numberofguests)
    @greeting = "Hi"
    @menu_id=menuid
    @date='27-Aug-2015'
    @numberOfGuests=numberofguests
    @username='batman'
    mail to: "udayan.das11@gmail.com"
  end
end
