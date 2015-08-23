
class PaymentsController < ApplicationController

  def index
  end

  def new
  end
  
  def create
    @payment = Payment.new(payment_params)
    @payment.card.ip_address = request.remote_ip
    if @payment.save
          if @payment.card.purchase
            redirect_to payment_path(@payment), notice: @payment.card.card_transaction.message
          else
            redirect_to payment_path(@payment), alert: @payment.card.card_transaction.message
          end
      end
    else
      render :new
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
