class PasswordsController < Devise::PasswordsController

  def create
    self.resource = resource_class.send_reset_password_instructions(params[resource_name])
    if successfully_sent?(resource)
      #respond_with({}, :location => after_sending_reset_password_instructions_path_for(resource_name))
      respond_to do |format|
        format.html { redirect_to after_sending_reset_password_instructions_path_for(resource_name) }
        format.json { render :json => {:info=>"Password reset mail has been set. Please follow the instructions in the mail" }.to_json }
      end
    else
      respond_to do |format|
        format.html { redirect_to new_password_path(resource_name),:notice => "bbb" }
        format.json { render :json => {:info=>"Password reset mail not sent,please make sure you are signed up and try later" }.to_json }
      end
    end
  end
end