class Admin::ConfigurablesController < AdminController
  include ConfigurableEngine::ConfigurablesController

  skip_before_filter :load_singular_resource
  skip_before_filter :authorize_resource

end
# Inherits from AdminController
class SettingsController < AdminController
  include ConfigurableEngine::ConfigurablesController

  skip_before_filter :load_singular_resource
  set_tab :settings

  def index
    @settings = Configurable.keys
  end
  
  private
  def authorize_resource
    authorize! params[:action], :settings
  end
end