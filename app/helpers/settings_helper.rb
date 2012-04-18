module SettingsHelper
  # Get the last item in namespaced setting var as label
  def setting_label(key)
    key.split(".").last.titleize
  end
end
