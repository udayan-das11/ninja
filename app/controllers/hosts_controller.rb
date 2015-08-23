class HostsController < ApplicationController
  before_action :set_host, only: [:show, :edit, :update, :destroy]

  # GET /hosts
  # GET /hosts.json
  def index
    session[:hostid]=1
    @hosts = Host.all
    @host = Host.new
    @post_attachments = PostAttachment.find_by_host_id(1)
    # @post_attachments = PostAttachment.all

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
    @reviews = Review.all
	 respond_to do |format|               
		format.js
	end     
  end
  
  # GET /hosts/1/edit
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
    puts("******************************************************");
    puts( params[:file]);
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

  # POST /hosts
  # POST /hosts.json
  def create
	    if (!params[:host][:uuid]&&!Host.exists?(emailid: params[:host][:emailid]))
		    mypass = Digest::SHA1.hexdigest(params[:host][:passwd].to_s)
			myconfPass = Digest::SHA1.hexdigest(params[:host][:confpasswrd].to_s)
			if (mypass==myconfPass) 
			    @host = Host.new(username:params[:host][:username], emailid:params[:host][:emailid], passwd:mypass, confpasswrd:myconfPass)
			    @host.save
				session[:hostEmailId]=@host.emailid
			else
			    flash[:error] = "Passwords do not match"
			end
			redirect_to :action => "index", :controller => "hosts"
		else
		    if (session[:hostuuid])
			    puts('444444')
		        @host = Host.find_by_uuid(session[:hostuuid])
			else
				puts('55555')
                @host = Host.find_by_emailid(session[:hostEmailId])
			end
			@host.update(lat:params[:lat],longi:params[:lng])
			puts('#######')
		      if @host.update(host_params)
					redirect_to :action => "mainpage", :controller => "hosts"
		      else
					flash[:error] = "Error in saving host"
		      end
		end
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
    @host = Host.omniauth(env['omniauth.auth'])
	session[:hostuuid]=@host.uuid
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
		@reviews=Review.all
		return
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
