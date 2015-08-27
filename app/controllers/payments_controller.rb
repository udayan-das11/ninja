
class PaymentsController < ApplicationController

  def index
    @payment=Payment.new
    @payment.card = Card.new
  end

  def new
  end
  
  def create
    @payment = Payment.new(payment_params)
    puts('##########'+request.remote_ip)
    @payment.card.ip_address = request.remote_ip
    if @payment.save
          response = GATEWAY.purchase(300,credit_card(@payment.card),:ip => @payment.card.ip_address)
          puts(response.to_json)
          if response.success?
             redirect_to :action => "mainpage", :controller => "hosts"
          else
            redirect_to :action => "index", :controller => "ninja"
          end

    else
      redirect_to :action => "index", :controller => "ninja"
    end
  end
  def show
  @payment=Payment.find(1);
  end

def hook
  params.permit! # Permit all Paypal input params
  status = params[:payment_status]
  if status == "Completed"
    @payment = Payment.find params[:invoice]
    @payment.update_attributes notification_params: params, status: status, transaction_id: params[:txn_id], purchased_at: Time.now
  end
  render nothing: true
end


  def credit_card(myCard)

    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
        :type               => myCard.card_type,
        :number             => myCard.card_number,
        :verification_value => myCard.card_verification,
        :month              => myCard.card_expires_on.to_formatted_s(:db)[5,6],
        :year               => myCard.card_expires_on.to_formatted_s(:db).first(4),
        :first_name         => myCard.first_name,
        :last_name          => myCard.last_name
    )
  end

  protect_from_forgery :except => :hook



  private
  # Use callbacks to share common setup or constraints between actions.
  def set_payment
   # @payment = Payment.find(1)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def payment_params
    params.require(:payment).permit(:course_id, :full_name, :company, :email, :telephone,
                                         card_attributes: [
                                             :first_name, :last_name, :card_type, :card_number,
                                             :card_verification, :card_expires_on])
  end
end
