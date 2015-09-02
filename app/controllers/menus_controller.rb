class MenusController < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_action :set_menu, only: [:show, :editMenu, :update, :destroy]

  # # GET /menus
  # # GET /menus.json
  # def index
  #   @menus = Menu.all
  #   @menu = Menu.new
  # end
  #
  # # GET /menus/1
  # # GET /menus/1.json
  # def show
  # end
  #
  # # GET /menus/new
  # def new
  #   @menu = Menu.new
  # end
  #
  # # GET /menus/1/editMenu
  # def editMenu
  # end
  #
  # def previewAlbum
  #  @menu_attachments = MenuAttachment.find_by_sql('select * from menu_attachments ')
  #
  #   respond_to do |format|
  #     format.html
  #     format.js {}
  #     format.json {
  #       render json: {:attachments => @menu_attachments}
  #     }
  #   end
  # end
  #
  # def create_photo
  #    @menu_attachment =  MenuAttachment.new(avatar: params[:file] , menu_id:'0')
  #   respond_to do |format|
  #     if @menu_attachment.save
  #       format.html { redirect_to @menu, notice: 'Menu attachment was successfully created.' }
  #       format.json { render :index, status: :created, location: @menu }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @menu_attachment.errors, status: :unprocessable_entity }
  #     end
  #   end
  #   head :ok
  # end
  #
  # # POST /menus
  # # POST /menus.json
  # def create
  #   items=params.size-6;
  #   @menu = Menu.new(menu_params)
  #   respond_to do |format|
  #     if @menu.save
  #       puts(@menu.id)
  #       MenuAttachment.where(menu_id: '0').update_all(menu_id:@menu.id)
  #       for i in 1..items
  #         itemFeild="Items"+i.to_s;
  #         @item=Item.new(name:params[itemFeild],Menu_id:@menu.id)
  #
  #         if (@item.name && !@item.name.blank?)
  #           @item.save;
  #         end
  #
  #       end
  #
  #       format.html { redirect_to :back, notice: 'Menu was successfully created.' }
  #       format.json { render :show, status: :created, location: @menu }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @menu.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # PATCH/PUT /menus/1
  # # PATCH/PUT /menus/1.json
  # def update
  #   respond_to do |format|
  #     if @menu.update(menu_params)
  #       format.html { redirect_to @menu, notice: 'Menu was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @menu }
  #     else
  #       format.html { render :editMenu }
  #       format.json { render json: @menu.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /menus/1
  # # DELETE /menus/1.json
  # def destroy
  #   @menu.destroy
  #   respond_to do |format|
  #     format.html { redirect_to menus_url, notice: 'Menu was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  #menus related Code
  #menus
  def create_photo_menus
    @menu_attachment =  MenuAttachment.new(avatar: params[:file] , menu_id:'0')
    @menu_attachment.save
    respond_to do |format|
      format.json{ render :json => @menu_attachment }
    end
  end
    def menuAdd
      # @menus = Menu.all
      @menu = Menu.new
      respond_to do |format|
        format.js
      end
    end

    def create
      puts ("#############################################")
      items=params.size-6
      @menu = Menu.new(menuTitle:params[:menu][:menuTitle] ,menuName:params[:menu][:menuName], menuType:params[:menu][:menuType],experience:params[:menu][:experience],timeSlot:params[:menu][:timeSlot],numberGuests:params[:menu][:noOfGuest],daysServed:params[:menu][:daysServed] )
      respond_to do |format|
        if @menu.save
          puts(@menu.id)
          MenuAttachment.where(menu_id: '0').update_all(menu_id:@menu.id)
          for i in 1..items
            itemFeild="Items"+i.to_s;
            descFeild="Desc"+i.to_s;
            typeFeild="Type"+i.to_s;
            tasteFeild="Taste"+i.to_s;
            @item=Item.new(name:params[itemFeild],desc:params[descFeild],typeItem:params[typeFeild],tastetype:params[tasteFeild],Menu_id:@menu.id)
            if (@item.name && !@item.name.blank?)
              @item.save;
            end

          end
          @menu_attachments = MenuAttachment.where("menu_id = ?", @menu.id)
          @items=Item.where("menu_id = ?", @menu.id)
          format.js {}

        else
          format.js {}
        end
      end
    end


  def previewAlbumMenu
    @menu_attachments = MenuAttachment.find_by_sql('select * from menu_attachments where Menu_id=0')
    puts("*********************************")
    puts(@menu_attachments.size)
    respond_to do |format|
      format.html
      format.js {}
      format.json {
        render json: {:attachments => @menu_attachments}
      }
    end
  end

  def editMenu
    @menu = Menu.find(params[:id])
    @items= Item.where(menu_id: @menu.id)
    @menu_attachment= MenuAttachment.where(menu_id: @menu.id)
    respond_to do |format|
      format.js {}
    end
  end

  def saveMenuAfterEdit
    @menu = Menu.find(params[:id])
    puts("*****************************")
    puts(@menu.timeSlot)
    puts(params[:menu][:menuTitle])
    @menu.update_attributes!(menuTitle:params[:menu][:menuTitle] ,menuName:params[:menu][:menuName], menuType:params[:menu][:menuType],experience:params[:menu][:experience],timeSlot:params[:menu][:timeSlot],numberGuests:params[:menu][:noOfGuest],daysServed:params[:menu][:daysServed] )
    @menu.save
    puts("****************** ***&&&&&&&&&&&&&&&&7********")
    if( !params[:menu][:items_attributes].nil?)
    params[:menu][:items_attributes].each do |key, value|
      item= Item.find_by(id:value["id"])
      item.update_attributes(name:value["name"],desc:value["desc"],tastetype:value["tastetype"])
      item.save
    end
    end
    @items= Item.where(menu_id: @menu.id)
    @menu_attachments= MenuAttachment.where(menu_id: @menu.id)
    respond_to do |format|
      format.js {}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu
      @menu = Menu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_params
      params.require(:menu).permit(:menuType, :experience, :Host_id)
    end
end
