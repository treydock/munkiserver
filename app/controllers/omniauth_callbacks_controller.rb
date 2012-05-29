class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :load_singular_resource
  skip_before_filter :authorize_resource
  skip_before_filter :require_valid_unit

  def cas
    @user = User.find_for_cas_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "CAS"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.cas_data"] = request.env["omniauth.auth"]
      redirect_to new_user_session_path
    end
  end

end
