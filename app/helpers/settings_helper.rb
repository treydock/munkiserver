module SettingsHelper
  # Get the last item in namespaced setting var as label
  def setting_label(key)
    key.split(".").last.titleize
  end
  
  def setting_input(formbuilder, key, definition)
    html = ""
    input_label = definition.attributes[:name].blank? ? setting_label(key) : definition.attributes[:name]
    input_type = definition.attributes[:input].blank? ? :string : definition.attributes[:input].to_sym
    input_value = Cockpit::Settings[key].blank? ? "" : Cockpit::Settings[key]
    
    if definition.attributes.has_key?(:options)
      html << formbuilder.input(key, :as => input_type, :collection => definition.attributes[:options],
                                :label => input_label, :input_html => setting_input_value(input_type, input_value))
    else
      html << formbuilder.input(key, :as => input_type, :label => input_label, :input_html => setting_input_value(input_type, input_value))
    end
    html.html_safe
  end
  
  def setting_input_value(input, value)
    input_html = {}
    
    case input
    when :boolean
      input_html = { :checked => "checked" } unless value == "0" || value.blank?
    else
      input_html = { :value => value }
    end
    
    input_html
  end
end
