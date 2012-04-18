# Inherits from AdminController
class SettingsController < AdminController

  skip_before_filter :load_singular_resource
  set_tab :settings

  def show
  end
  
  def update
    params[:settings].each_pair do |setting,value|
      Settings[setting] = value
    end
    redirect_to admin_settings_path
  end

  private
  def authorize_resource
    authorize! params[:action], :settings
  end
end
