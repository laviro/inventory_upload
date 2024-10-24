require "#{ForemanRhCloud::Engine.root}/lib/foreman_rh_cloud/version"

Rails.autoloaders.main.ignore(
  ForemanRhCloud::Engine.root.join('lib/foreman_rh_cloud/version.rb')
)
