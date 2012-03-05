# Inherits from AdminController
class SettingsController < AdminController
  skip_before_filter :load_singular_resource
  set_tab :settings

  def index
  end
  
  private
  def authorize_resource
    authorize! params[:action], :settings
  end
end
