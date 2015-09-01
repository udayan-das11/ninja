class RegistrationsController < Devise::RegistrationsController

  clear_respond_to
  respond_to :json
    protected

    def after_inactive_sign_up_path_for(resource)
      puts('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
      return '/thanks'
    end

    def thanks
      puts('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
    end
end
