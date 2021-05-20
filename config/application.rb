require_relative "boot"

# https://github.com/rails/rails/blob/main/railties/lib/rails/all.rb
# 使わない機能を読み込まないようにする
[
  "active_record/railtie",
  "active_storage/engine",
  "action_controller/railtie",
  "action_view/railtie",
  "action_mailer/railtie",
  "active_job/railtie",
  #"action_cable/engine",
  #"action_mailbox/engine",
  #"action_text/engine",
  "rails/test_unit/railtie",
  #"sprockets/railtie"
].each do |railtie|
  begin
    require railtie
  rescue LoadError
  end
end

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load
module RailsApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.generators do |g|
      g.api true
      g.assets false
      g.force_plural false
      g.helper false
      g.integration_tool nil
      g.orm :active_record
      g.resource_controller :controller
      g.resource_route true
      g.scaffold_controller :scaffold_controller
      g.stylesheets false
      g.stylesheet_engine nil
      g.scaffold_stylesheet false
      g.system_tests nil
      g.template_engine :erb
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: true
    end
    config.active_storage.draw_routes = false
    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :utc
  end
end
