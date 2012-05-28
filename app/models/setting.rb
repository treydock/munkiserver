class Setting < ActiveRecord::Base
#  store_configurable
  belongs_to :category, :foreign_key => "category_id", :class_name => "SettingCategory"
  
  validates_uniqueness_of :name, :scope => [:category_id]
  
  serialize :options
  
  # Override value output only if boolean
  # Necessary to work with the best_in_place evaluation for checkbox input
  def view_value
    self.input_type.eql?("boolean") ? self[:value].to_bool : self[:value]
  end

  def self.table_exists?
    ActiveRecord::Base.connection.tables.include?("settings")
  end

  def self.by_category(category)
    SettingCategory.find_by_name(category)
  end

end