if Setting.table_exists? # Workaround to allow migrations to take place
  Devise.setup do |config|
    
    @external_auth_settings = Setting.by_category("external_authentication")
    unless @external_auth_settings.nil?
    
      ## CAS ##
      if @external_auth_settings.get_setting(:type) == "cas"
        @cas_settings = Setting.by_category("cas_authentication")
        config.omniauth :cas, :host => @cas_settings.get_setting(:host), :ssl => @cas_settings.get_setting(:use_ssl) unless @cas_settings.get_setting(:host).nil?
      end
      
      ## LDAP ##
      if @external_auth_settings.get_setting(:type) == "ldap"
        @ldap_settings = Setting.by_category("ldap_authentication")
        ## TODO - Add LDAP config ##
      end
    end
  end
end