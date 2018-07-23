require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module RailsTravelingSite01
  class Application < Rails::Application
    config.load_defaults 5.2
    config.generators.system_tests = nil
    I18n.load_path += Dir[Rails.root.join("lib", "locale", "*.{rb,yml}")]
    I18n.available_locales = [:en, :vi]
    I18n.default_locale = :vi
  end
end
