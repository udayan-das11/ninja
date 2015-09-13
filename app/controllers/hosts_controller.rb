class HostsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_host, only: [:show, :edit, :update, :destroy]

  # GET /hosts
  # GET /hosts.json
  def askhostdetails
    if (host_signed_in?)
      session[:hostid]=current_host.id;
      @host=current_host
      puts('############3 '+session[:hostid].to_s)
      @post_attachments = PostAttachment.find_by_host_id(session[:hostid])
      if (@host.lat==nil)
        puts('&&&&&&&&&&&&&')
        redirect_to :action => "index", :controller => "hosts", :params => {:host=>{:emailid=>@host.emailid}}
      else
        puts('$$$$$$$$$$$$$$$ yo buddy')
        session[:hostId]=@host.emailid
        session[:hostUsername]=@host.username
        redirect_to :action => "mainpage", :controller => "hosts"
      end
    end
  end
  def index
    @host = Host.find(session[:hostid])
    @post_attachments = PostAttachment.find_by_host_id(session[:hostid])
  end

  # GET /hosts/1
  # GET /hosts/1.json
  def show

  end

  # GET /hosts/new
  def new
    @host = Host.new
  end

  def reviews
    @reviews=Review.order( "created_at DESC")
    respond_to do |format|
      format.js
    end
  end

  def updateReview
    Review.where( id: params[:reviewID]).update_all( status: 'seen' )
    @reviews=Review.order( "created_at DESC")
    @unread_review_count=Review.where("status='new'").count
    respond_to do |format|
      format.html
      format.js {}
      format.json {
        render json: {:count => @unread_review_count}
      }
    end
  end


  # GET /hosts/1/editMenu
  def edit
  end

  #Photo Upload
  def previewAlbum
    @post_attachments = PostAttachment.find_by_sql('select * from post_attachments where host_id=1')
    puts("6363635653536653356653635635653635653653"+"    "+@post_attachments.to_json)
    respond_to do |format|
      format.html
      format.js {}
      format.json {
        render json: {:attachments => @post_attachments}
      }
    end
  end

  def create_photo
    # @post_attachments=@host.post_attachments.all
    puts("******************************************************")
    puts( params[:file])
    @post_attachment =  PostAttachment.new(avatar: params[:file] , host_id:session[:hostid])

    respond_to do |format|
      if @post_attachment.save
        format.html { redirect_to @host, notice: 'Post attachment was successfully created.' }
        format.json { render :index, status: :created, location: @host }
      else
        format.html { render :new }
        format.json { render json: @post_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_profilephoto
    # @post_attachments=@host.post_attachments.all
    puts("******************************************************")
    puts( params[:file])
    @profile_photo=  ProfilePhoto.new(avatar: params[:file] , host_id:session[:hostid])

    respond_to do |format|
      if @profile_photo.save
        format.html { redirect_to @host, notice: 'Post attachment was successfully created.' }
        format.json { render :index, status: :created, location: @host }
      else
        format.html { render :new }
        format.json { render json: @profile_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_coverphoto
    # @post_attachments=@host.post_attachments.all
    puts("******************************************************")
    puts( params[:file])
    @cover_photo =  CoverPhoto.new(avatar: params[:file] , host_id:session[:hostid])

    respond_to do |format|
      if @cover_photo.save
        format.html { redirect_to @host, notice: 'Post attachment was successfully created.' }
        format.json { render :index, status: :created, location: @host }
      else
        format.html { render :new }
        format.json { render json: @cover_photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /hosts
  # POST /hosts.json
  def create
        @host=Host.find(session[:hostid])
        @host.update(host_params)
        @host.update(lat:params[:lat],longi:params[:lng])
        if (!@host.provider)
          @host.update(provider:'simple')
        end
        redirect_to :action => "mainpage", :controller => "hosts"
  end


  # PATCH/PUT /hosts/1
  # PATCH/PUT /hosts/1.json
  def update
    respond_to do |format|
      if @host.update(host_params)
        format.html { redirect_to @host, notice: 'Host was successfully updated.' }
        format.json { render :show, status: :ok, location: @host }
      else
        format.html { render :edit }
        format.json { render json: @host.errors, status: :unprocessable_entity }
      end
    end
  end
  def loginFB
    @host = Host.omniauthmyauth(env['omniauth.auth'])
    session[:hostuuid]=@host.uuid
    puts('%%%%%%%%'+@host.id.to_s)
    session[:hostid]=@host.id
    if (@host.lat==nil)
      puts('&&&&&&&&&&&&&')
      redirect_to :action => "index", :controller => "hosts", :params => {:host=>{:emailid=>@host.emailid,:provider=>'facebook',:uuid=>@host.uuid}}
    else
      puts('$$$$$$$$$$$$$$$ yo buddy')
      session[:hostId]=@host.emailid
      session[:hostUsername]=@host.username
      redirect_to :action => "mainpage", :controller => "hosts"
    end
  end
  # DELETE /hosts/1
  # DELETE /hosts/1.json
  def destroy
    @host.destroy
    respond_to do |format|
      format.html { redirect_to hosts_url, notice: 'Host was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def mainpage
    @reviews=Review.order( "created_at DESC")
    @unread_review_count=Review.where("status='new'").count
    session[:pendingOrdersCount]=OrderTable.where("status = ? AND Host_id = ?", 'new', 1).count

    MenuAttachment.where("Menu_id=0").delete_all
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_host
    @host = Host.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def host_params
    params.require(:host).permit(:name, :addr, :lat, :longi, :age, :phoneno, :qualification, :profession, :languages, :blog, :idcard, :cardtype, :food, :destination, :toddlrReason, :reasonToenjycooking, :frequencyofCooking)
  end
  
end