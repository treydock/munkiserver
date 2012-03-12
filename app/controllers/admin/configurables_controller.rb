class Admin::ConfigurablesController < ApplicationController
  include ConfigurableEngine::ConfigurablesController

  skip_before_filter :load_singular_resource
  skip_before_filter :authorize_resource

  layout false
end
