class MenuAttachmentsController < ApplicationController
  before_action :set_menu_attachment, only: [:show, :edit, :update, :destroy]

  # GET /menu_attachments
  # GET /menu_attachments.json
  def index
    @menu_attachments = MenuAttachment.all
  end

  # GET /menu_attachments/1
  # GET /menu_attachments/1.json
  def show
  end

  # GET /menu_attachments/new
  def new
    @menu_attachment = MenuAttachment.new
  end

  # GET /menu_attachments/1/edit
  def edit
  end

  # POST /menu_attachments
  # POST /menu_attachments.json
  def create
    @menu_attachment = MenuAttachment.new(menu_attachment_params)

    respond_to do |format|
      if @menu_attachment.save
        format.html { redirect_to @menu_attachment, notice: 'Menu attachment was successfully created.' }
        format.json { render :show, status: :created, location: @menu_attachment }
      else
        format.html { render :new }
        format.json { render json: @menu_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_attachments/1
  # PATCH/PUT /menu_attachments/1.json
  def update
    respond_to do |format|
      if @menu_attachment.update(menu_attachment_params)
        format.html { redirect_to @menu_attachment, notice: 'Menu attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu_attachment }
      else
        format.html { render :edit }
        format.json { render json: @menu_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_attachments/1
  # DELETE /menu_attachments/1.json
  def destroy
    @menu_attachment.destroy
    respond_to do |format|
      format.html { redirect_to menu_attachments_url, notice: 'Menu attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_attachment
      @menu_attachment = MenuAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_attachment_params
      params.require(:menu_attachment).permit(:menu_id, :avatar)
    end
end
