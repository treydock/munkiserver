if Setting.table_exists? # Workaround to allow migrations to take place
  # Load server configuration from Setting
  @action_mailer_settings = Setting.by_category("action_mailer")
  @smtp_settings = Setting.by_category("smtp")
  @sendmail_settings = Setting.by_category("sendmail")

  unless @action_mailer_settings.nil?
    # Setup action mailer settings
    ActionMailer::Base.default_url_options[:host] = @action_mailer_settings.get_setting(:host) unless @action_mailer_settings.get_setting(:host).blank?
    ActionMailer::Base.delivery_method = @action_mailer_settings.get_setting(:delivery_method) unless @action_mailer_settings.get_setting(:delivery_method).blank?

    # Setup action mailer delivery method
    case @action_mailer_settings.get_setting(:delivery_method)
    when "sendmail"
      ActionMailer::Base.sendmail_settings = @sendmail_settings.values_hash unless @sendmail_settings.nil?
    when "smtp"
      ActionMailer::Base.smtp_settings = @smtp_settings.values_hash unless @smtp_settings.nil?
    else
    end
  # config.action_mailer.raise_delivery_errors = true
  end
end