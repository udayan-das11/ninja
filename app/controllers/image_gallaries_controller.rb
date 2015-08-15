class ImageGallariesController < ApplicationController
  before_action :set_image_gallary, only: [:show, :edit, :update, :destroy]

  # GET /image_gallaries
  # GET /image_gallaries.json
  def index
    @image_gallaries = ImageGallary.all
  end

  # GET /image_gallaries/1
  # GET /image_gallaries/1.json
  def show
  end

  # GET /image_gallaries/new
  def new
    @image_gallary = ImageGallary.new
  end

  # GET /image_gallaries/1/edit
  def edit
  end

  # POST /image_gallaries
  # POST /image_gallaries.json
  def create
    @image_gallary = ImageGallary.new(image_gallary_params)

    respond_to do |format|
      if @image_gallary.save
        format.html { redirect_to @image_gallary, notice: 'Image gallary was successfully created.' }
        format.json { render :show, status: :created, location: @image_gallary }
      else
        format.html { render :new }
        format.json { render json: @image_gallary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_gallaries/1
  # PATCH/PUT /image_gallaries/1.json
  def update
    respond_to do |format|
      if @image_gallary.update(image_gallary_params)
        format.html { redirect_to @image_gallary, notice: 'Image gallary was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_gallary }
      else
        format.html { render :edit }
        format.json { render json: @image_gallary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_gallaries/1
  # DELETE /image_gallaries/1.json
  def destroy
    @image_gallary.destroy
    respond_to do |format|
      format.html { redirect_to image_gallaries_url, notice: 'Image gallary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_gallary
      @image_gallary = ImageGallary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_gallary_params
      params.require(:image_gallary).permit(:image_id, :references)
    end
end
