Cockpit :active_record do
  site do
    external_auth do
      type "",
        :options  => Hash[Users::OmniauthCallbacksController.instance_methods(false).map {|o| [o.to_s.upcase,o.to_s]}],
        :input    => :select
      host "",
        :input    => :string
      use_ssl 1,
        :input    => :boolean
    end

    action_mailer do
      host "localhost:3000",
        :input    => :string
      delivery_method "sendmail",
        :options   => ["smtp","sendmail","test","file"],
        :input     => :select
    end

    smtp do
      address "",
        :input     => :string
      port "",
        :input     => :string
      username "",
        :input     => :string
      password "",
        :input     => :string
      authentication "",
        :options   => ["plain","login","cram_md5"],
        :input     => :select
      enable_starttls_auto "",
        :input     => :boolean
    end

    sendmail do
      location "/usr/sbin/sendmail",
        :input     => :string
    end
  end
end