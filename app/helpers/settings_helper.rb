module SettingsHelper
  
  def setting_input(setting)

    case setting.input_type
    when "select"
      best_in_place(setting, :view_value, :type => :select, :collection => setting.options, :path => admin_setting_path(setting), :nil => "Click to edit", :data => setting_input_data(setting))
    when "boolean"
      best_in_place(setting, :view_value, :type => :checkbox, :path => admin_setting_path(setting), :nil => "Click to edit", :data => setting_input_data(setting))
    else
      best_in_place(setting, :view_value, :type => :input, :path => admin_setting_path(setting), :nil => "Click to edit", :data => setting_input_data(setting))
    end
  end
  
  def setting_input_data(setting)
    { :setting => "#{setting.category.name}_#{setting.name}" }
  end
end
