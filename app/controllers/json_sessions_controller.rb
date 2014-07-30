class JsonSessionsController < Devise::SessionsController

  before_filter :require_user_signed_in, except: [:new, :create]

  def create
    # respond_to do |format|
    #   format.html { super }
    #   format.json {

    #   puts "JSON!"
    #   puts params
    #   puts controller_path

    #     warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
    #     render :status => 200, :json => { :error => "Success" }
    #   }
    # end
    user = User.find_for_database_authentication(email: params[:user][:email])

    if user && user.valid_password?(params[:user][:password])
      sign_in user
      render json: {
        session: { id: user.id, email: user.email }
      }, status: :created
    else
      render json: {
        errors: {
          email: "invalid email or password"
        }
      }, status: :unprocessable_entity
    end

  end

  def destroy
    super
  end
end
