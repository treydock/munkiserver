class PackageCategory < ActiveRecord::Base
#  has_many :icons, :dependent => :destroy
#  accepts_nested_attributes_for :icons,
#    :reject_if      => proc { |attributes| attributes['photo'].nil? },
#    :allow_destroy  => true
  belongs_to :icon

  
  # Return the default package category
  # Grabs a record named "Misc" or the first record
  def self.default(installer_type = nil)
    d = nil
    # Depending on the installer_type, assign a specific package category
    case installer_type
      when "appdmg" then d = self.find_by_name("Application")
      when "adobeuberinstaller" then d = self.find_by_name("Application")
      else d = self.find_by_name("Misc")
    end
    # If the above assignment fails, grab the first available package category
    d ||= self.first
    d
  end
  
  def to_s
    name
  end

  # Setter for new_icon virtual attribute
  # Creates a new icon object and assigns to self.icon
  def new_icon=(value)
    # Create new icon unless value.blank?
    unless value.blank?
      i = Icon.new({:photo => value})
      # If icon is saved, assign it to the record
      self.icon = i if i.save
    end
  end
end

