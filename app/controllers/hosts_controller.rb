class HostsController < ApplicationController
  before_action :set_host, only: [:show, :edit, :update, :destroy]

  # GET /hosts
  # GET /hosts.json
  def index
    @hosts = Host.all
    @host = Host.new
	@hostID = 1;
  end

  # GET /hosts/1
  # GET /hosts/1.json
  def show
   
  end

  # GET /hosts/new
  def new
    @host = Host.new
  end

  # GET /hosts/1/edit
  def edit
  end

  # POST /hosts
  # POST /hosts.json
  def create
    if (!Host.exists?(emailid: params[:host][:emailid]))
	    mypass = Digest::SHA1.hexdigest(params[:host][:passwd].to_s)
		myconfPass = Digest::SHA1.hexdigest(params[:host][:confpasswrd].to_s)
		if (mypass==myconfPass) 
		    @host = Host.new(username:params[:host][:username], emailid:params[:host][:emailid], passwd:mypass, confpasswrd:myconfPass)
		    @host.save
			session[:hostId]=@host.emailid
		else
		    flash[:error] = "Passwords do not match"
		end
		redirect_to :action => "index", :controller => "hosts"
	else
	    @host = Host.find_by_emailid(session[:hostId])
		@host.update(lat:params[:lat],longi:params[:lng])
		puts('#######')
	    respond_to do |format|
	      if @host.update(host_params)
	        format.html { redirect_to @host, notice: 'Host was successfully created.' }
	        format.json { render :show, status: :created, location: @host }
	      else
	        format.html { render :new }
	        format.json { render json: @host.errors, status: :unprocessable_entity }
	      end
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
	if (@host.lat==nil)
	    puts('&&&&&&&&&&&&&')
	    redirect_to :action => "create", :controller => "hosts"
	else
	    puts('$$$$$$$$$$$$$$$ yo buddy')
	    session[:hostId]=@host.emailid
	    redirect_to :action => "show", :controller => "ninja"
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
