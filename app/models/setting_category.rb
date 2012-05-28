class SettingCategory < ActiveRecord::Base
  has_many :settings, :foreign_key => "category_id"
  
  def get_setting(key)
    @setting = Setting.find_by_name_and_category_id(key.to_s, self.id)
    @setting.value unless @setting.nil?
  end
  
  def values_hash
    Setting.where(:category_id => self.id).inject({}) do |hash,setting|
      hash[setting.name] = setting.value
      hash
    end
  end

end
