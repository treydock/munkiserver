class SettingsController < ApplicationController
  skip_before_filter :load_singular_resource
  layout "admin_sections"

  def index
  end
  
  private
  def authorize_resource
    authorize! params[:action], :settings
  end
end
