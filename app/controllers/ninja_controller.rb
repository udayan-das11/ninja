class NinjaController < ApplicationController

  helper_method :resource, :resource_name, :devise_mapping

  def index

  end

  def resource_name
    puts('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$')
    :host
  end

  def resource
    @resource ||= Host.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:host]
  end

  def mainpage
      @menus = Menu.all
  end

  def refreshPage
    puts('$$$$$$$$$$$$$$$$$$$$$$$')
    @menus = Menu.where('price < ?',params[:host][:budget])
    puts(@menus.size)

    respond_to do |format|
      format.js
    end
  end

end
