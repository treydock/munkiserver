#####
# Put actions and authorization before_filter here
# for all admin sections
####
class AdminController < ApplicationController
# Alternative to use of helper is_admin_namespace? in the application layout
#  layout "admin"
  before_filter :authorize_resource

  def index
  end
  
  private
  def authorize_resource
    authorize! params[:action], :admin
  end
end
