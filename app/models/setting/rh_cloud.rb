class Setting::RhCloud < Setting
  ::Setting::BLANK_ATTRS.concat %w{rh_cloud_token}

  def self.default_settings
    return unless ActiveRecord::Base.connection.table_exists?('settings')
    return unless super
    [
      set('allow_auto_inventory_upload', N_('Allow automatic upload of the host inventory to the Red Hat cloud'), false, N_('Allow automatic inventory uploads')),
      set('allow_auto_insights_sync', N_('Allow recommendations synchronization from Red Hat cloud'), false, N_('Allow recommendations synchronization')),
      set('obfuscate_inventory_hostnames', N_('Obfuscate host names sent to Red Hat cloud'), false, N_('Obfuscate host names')),
      set('obfuscate_inventory_ips', N_('Obfuscate ip addresses sent to Red Hat cloud'), false, N_('Obfuscate IPs')),
      set('rh_cloud_token', N_('Authentication token to Red Hat cloud services. Used to authenticate requests to cloud APIs'), nil, N_('Red Hat Cloud token'), nil, encrypted: true),
      set('exclude_installed_packages', N_('Exclude installed packages from Red Hat cloud inventory report'), false, N_("Don't upload installed packages")),
      set('include_parameter_tags', N_('Should import include parameter tags from Foreman?'), false, N_('Include parameters in insights-client reports')),
    ]
  end

  def self.humanized_category
    N_('RH Cloud')
  end
end
