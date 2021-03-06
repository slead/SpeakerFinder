require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SpeakerFinder
  class Application < Rails::Application
    #http://rubyinrails.com/2014/02/rails-nameerror-uninitialized-constant-class-solution/
    config.autoload_paths += %W(#{config.root}/lib)
  
    config.serve_static_assets = true
    config.assets.precompile += %w(vendor/modernizr *.png *.jpeg *.jpg *.gif)
    
    if defined?(Bundler)
      # If you precompile assets before deploying to production, use this line
      #Bundler.require(*Rails.groups(:assets => %w(development test)))
      # If you want your assets lazily compiled in production, use this line
       Bundler.require(:default, :assets, Rails.env)
    end
    
    #Using Devise on Heroku with Ruby on Rails 3.1 requires setting:
    config.assets.initialize_on_precompile = true
    
    config.assets.compile = true
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    
    WillPaginate.per_page = 10
  end
end
