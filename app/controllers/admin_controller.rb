class AdminController < ApplicationController
  skip_before_filter :load_singular_resource
  layout "admin"

  def index
  end
  
  private
  def authorize_resource
    authorize! params[:action], :admin
  end
end
