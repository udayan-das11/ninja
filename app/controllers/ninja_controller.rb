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
end
