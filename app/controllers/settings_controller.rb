# Inherits from AdminController
class SettingsController < AdminController

  skip_before_filter :load_singular_resource
  set_tab :settings

  def index
    @setting_categories = SettingCategory.find(:all)
  end
  
  def update
    @setting = Setting.find(params[:id])

    respond_to do |format|
      @setting.update_attributes(:value => params[:setting][:view_value])
      format.json { respond_with_bip(@setting) }
    end
  end

  private
  def authorize_resource
    authorize! params[:action], :settings
  end
end
