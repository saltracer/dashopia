class JsonRegistrationsController < Devise::RegistrationsController
  respond_to :json
  after_action :set_csrf_headers, only: [:create, :destroy]
  before_action :configure_permitted_parameters

  def create
    build_resource(user_params)

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        #sign_up(resource_name, resource)
        return render :json => {:success => true}
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
        return render :json => {:success => true}
      end
    else
      clean_up_passwords resource
      return render :json => resource.errors, :status=>422
    end
  end

  # Signs in a user on sign up. You can overwrite this method in your own
  # RegistrationsController.
  def sign_up(resource_name, resource)
    sign_in(resource_name, resource)
  end

  protected

  def set_csrf_headers
    if request.xhr?
      response.headers['X-CSRF-Token'] = "#{form_authenticity_token}"
      response.headers['X-CSRF-Param'] = "#{request_forgery_protection_token}"
    end
  end

  private
  def user_params
    devise_parameter_sanitizer.sanitize(:sign_up)# { |u| u.permit({ roles: [] }, :email, :password, :password_confirmation) }
  end
end
