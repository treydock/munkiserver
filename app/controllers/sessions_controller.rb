class SessionsController < Devise::SessionsController
  skip_before_filter :authenticate_user!
  skip_before_filter :load_singular_resource
  skip_before_filter :require_valid_unit
  
  private
  def authorize_resource
    authorize! params[:action].to_sym, :session
  end
end
