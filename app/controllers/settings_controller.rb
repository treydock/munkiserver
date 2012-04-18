# Inherits from AdminController
class SettingsController < AdminController
  include ConfigurableEngine::ConfigurablesController

  skip_before_filter :load_singular_resource
  set_tab :settings

  def show
    @settings = Setting.keys.delete_if {|s| s.starts_with?("external_auth")}
    @auth_settings = Setting.keys.delete_if {|s| !s.starts_with?("external_auth")}
  end
  
  def update
    Setting.keys.each do |key|
      Setting.find_or_create_by_name(key).update_attribute(:value,params[key])
    end

    redirect_to admin_settings_path
  end

  private
  def authorize_resource
    authorize! params[:action], :settings
  end
end
