# Inherits from AdminController
class PackageCategoriesController < AdminController
  set_tab :package_categories

  def index
    @package_categories = PackageCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @package_categories }
    end
  end

  def show
    @package_category = PackageCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @package_category }
    end
  end

  def new
    @package_category = PackageCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @package_category }
    end
  end

  def edit
    @package_category = PackageCategory.find(params[:id])
  end

  def create
    @package_category = PackageCategory.new(params[:package_category])

    respond_to do |format|
      if @package_category.save
        format.html { redirect_to(@package_category, :notice => 'Package category was successfully created.') }
        format.xml  { render :xml => @package_category, :status => :created, :location => @package_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @package_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @package_category = PackageCategory.find(params[:id])

    respond_to do |format|
      if @package_category.update_attributes(params[:package_category])
        format.html { redirect_to(@package_category, :notice => 'Package category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @package_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @package_category = PackageCategory.find(params[:id])
    @package_category.destroy

    respond_to do |format|
      format.html { redirect_to(package_categories_url) }
      format.xml  { head :ok }
    end
  end

  private
  # Load a singular resource into @package_category for all actions
  def load_singular_resource
    action = params[:action].to_sym
    if [:show, :edit, :update, :destroy].include?(action)
      @package_category = PackageCategory.find(params[:id])
    elsif [:index, :new, :create].include?(action)
      @package_category = PackageCategory.new
    else
      raise Exception.new("Unable to load singular resource for #{action} action in #{params[:controller]} controller.")
    end
  end
end
