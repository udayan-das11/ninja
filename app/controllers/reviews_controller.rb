class ReviewsController < ApplicationController

  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /hosts
  # GET /hosts.json
  def index
   @review = Review.new
   @reviews = Review.all.order(created_at: :desc)
   @profile_photo= ProfilePhoto.where(host_id:1).first
   puts("*************************************************************")
   puts(@profile_photo.avatar.url)
   @cover_photo= CoverPhoto.where(host_id:1).first
   @host=Host.find(1)
   @menus = Menu.where(host_id:1)
   @menu_attachments= MenuAttachment.where(menu_id:1)
   @post_attachments=PostAttachment.where(Host_id:1)

  end

  # GET /hosts/1
  # GET /hosts/1.json
  def show

  end

  # GET /hosts/new
  def new

  end

  def reviews

  end


  # GET /hosts/1/editMenu
  def edit
  end


  def create
    #overall rating calculator
    amb=params[:subcomment][:ambience].to_f
    soc=params[:subcomment][:social].to_f
    coo=params[:subcomment][:cooking].to_f
    unk=params[:subcomment][:unknown].to_f
    avgOverall=((amb+soc+coo+unk)/4).to_f
    intOverall=avgOverall.to_i
    if((avgOverall-intOverall)>0.5)
      overall= intOverall+0.5
    else
      overall=intOverall
    end

    @review =  Review.new(overall:overall,cooking:params[:subcomment][:cooking],ambiance:params[:subcomment][:ambience],social:params[:subcomment][:social],x:params[:subcomment][:unknown],text:params[:subcomment][:text])
    @review.save
    @reviews= Review.all.order(created_at: :desc)
    # @host = Host.find_by_sql("select * from hosts where id='1'")

    respond_to do |format|
      format.js
    end
  end

  # PATCH/PUT /hosts/1
  # PATCH/PUT /hosts/1.json
  def update

  end

 def detailsFromMenu
   @items= Items.where("menu_id= ?",:id)
   @menu_attachments= MenuAttachment.where("menu_id= ?",:id)
   respond_to do |format|
     format.js
   end
end
  # DELETE /hosts/1
  # DELETE /hosts/1.json
  def destroy

  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.

end