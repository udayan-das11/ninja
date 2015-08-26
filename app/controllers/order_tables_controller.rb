class OrderTablesController < ApplicationController
  before_action :set_order_table, only: [:show, :edit, :update, :destroy]

  # GET /order_tables
  # GET /order_tables.json
  def index
    @order_tables = OrderTable.all
  end

  # GET /order_tables/1
  # GET /order_tables/1.json
  def show
  end

  # GET /order_tables/new
  def new
    @order_table = OrderTable.new
  end

  # GET /order_tables/1/edit
  def edit
  end

  # POST /order_tables
  # POST /order_tables.json
  def create
    @order_table = OrderTable.new(order_table_params)

    respond_to do |format|
      if @order_table.save
        format.html { redirect_to @order_table, notice: 'Order table was successfully created.' }
        format.json { render :show, status: :created, location: @order_table }
      else
        format.html { render :new }
        format.json { render json: @order_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_tables/1
  # PATCH/PUT /order_tables/1.json
  def update
    respond_to do |format|
      if @order_table.update(order_table_params)
        format.html { redirect_to @order_table, notice: 'Order table was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_table }
      else
        format.html { render :edit }
        format.json { render json: @order_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_tables/1
  # DELETE /order_tables/1.json
  def destroy
    @order_table.destroy
    respond_to do |format|
      format.html { redirect_to order_tables_url, notice: 'Order table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def loadOrdersForGuests
    @orderForGuests=OrderTable.where(:Host_id => '1').order('created_at DESC')
    respond_to do |format|
      format.js
    end
  end

  def updateOrderForGuestAccept
    OrderTable.where( id: params[:orderID]).update_all( status: 'seen' )
    @orderForGuests=OrderTable.where(:Host_id => '1').order('created_at DESC')
    session[:pendingOrdersCount]=OrderTable.where("status = ? AND Host_id = ?", 'new', 1).count
        respond_to do |format|
          format.html
          format.js {}
          format.json {
            render json: {:count => session[:pendingOrdersCount]}
          }
        end
  end

  def updateOrderForGuestReject
    OrderTable.delete(params[:orderID])
    @orderForGuests=OrderTable.where(:Host_id => '1').order('created_at DESC')
    session[:pendingOrdersCount]=OrderTable.where("status = ? AND Host_id = ?", 'new', 1).count
        respond_to do |format|
          format.html
          format.js {}
          format.json {
            render json: {:count => session[:pendingOrdersCount]}
          }
        end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_table
      @order_table = OrderTable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_table_params
      params.require(:order_table).permit(:date, :timeslotfrom, :timeslotto, :customization, :status, :paymentid, :Host_id, :User_id)
    end
end
