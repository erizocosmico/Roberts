# encoding: utf-8
module Web
# encoding: utf-8
  require 'rack/protection'
# encoding: utf-8
  require 'i18n'
# encoding: utf-8
  require 'mail'
# encoding: utf-8

# encoding: utf-8
  # Setup internationalization
# encoding: utf-8
  I18n.load_path = Dir["#{ __dir__ }/locales/*.yml"]
# encoding: utf-8
  I18n.backend.load_translations
# encoding: utf-8
  I18n.default_locale = :en
# encoding: utf-8

# encoding: utf-8
  # Setup email delivery to use Mandrill
# encoding: utf-8
  Mail.defaults do
# encoding: utf-8
    delivery_method :smtp, {
# encoding: utf-8
      :port      => 587,
# encoding: utf-8
      :address   => "smtp.mandrillapp.com",
# encoding: utf-8
      :user_name => ENV['MANDRILL_USERNAME'],
# encoding: utf-8
      :password  => ENV['MANDRILL_PASSWORD']
# encoding: utf-8
    }
# encoding: utf-8
  end
# encoding: utf-8

# encoding: utf-8
  class Application < Lotus::Application
# encoding: utf-8
    configure do
# encoding: utf-8
      ##
# encoding: utf-8
      # BASIC
# encoding: utf-8
      #
# encoding: utf-8

# encoding: utf-8
      root __dir__
# encoding: utf-8

# encoding: utf-8
      load_paths << [
# encoding: utf-8
        'middlewares',
# encoding: utf-8
        'helpers',
# encoding: utf-8
        'presenters',
# encoding: utf-8
        'controllers',
# encoding: utf-8
        'views'
# encoding: utf-8
      ]
# encoding: utf-8

# encoding: utf-8
      ##
# encoding: utf-8
      # HTTP
# encoding: utf-8
      #
# encoding: utf-8

# encoding: utf-8
      routes 'config/routes'
# encoding: utf-8

# encoding: utf-8
      # Configure Rack middleware for this application
# encoding: utf-8
      middleware.use Rack::Session::Cookie, secret: ENV['WEB_SESSIONS_SECRET']
# encoding: utf-8
      middleware.use Rack::Protection::IPSpoofing
# encoding: utf-8
      middleware.use Rack::Protection::SessionHijacking
# encoding: utf-8
      middleware.use Rack::Protection::PathTraversal
# encoding: utf-8
      middleware.use Rack::Protection::FrameOptions
# encoding: utf-8
      middleware.use Rack::Protection::RemoteReferrer
# encoding: utf-8
      middleware.use Rack::Protection::FormToken
# encoding: utf-8
      middleware.use Rack::Protection::JsonCsrf
# encoding: utf-8
      middleware.use Rack::Protection::RemoteToken
# encoding: utf-8
      middleware.use Rack::Protection::HttpOrigin
# encoding: utf-8

# encoding: utf-8
      # Default format for the requests that don't specify an HTTP_ACCEPT header
# encoding: utf-8
      default_format :html
# encoding: utf-8

# encoding: utf-8
      ##
# encoding: utf-8
      # TEMPLATES
# encoding: utf-8
      #
# encoding: utf-8

# encoding: utf-8
      # The layout to be used by all the views
# encoding: utf-8
      layout :application
# encoding: utf-8

# encoding: utf-8
      # The relative path where to find the templates
# encoding: utf-8
      #
# encoding: utf-8
      templates 'templates'
# encoding: utf-8

# encoding: utf-8
      ##
# encoding: utf-8
      # ASSETS
# encoding: utf-8
      #
# encoding: utf-8

# encoding: utf-8
      # Enabling serving assets
# encoding: utf-8
      serve_assets true
# encoding: utf-8

# encoding: utf-8
      controller.prepare do
# encoding: utf-8
        include Roberts::Model
# encoding: utf-8
        include Web::Helpers::Form
# encoding: utf-8
        include Web::Helpers::Session
# encoding: utf-8
        include Web::Middlewares::Auth
# encoding: utf-8
        include Web::Helpers::Links
# encoding: utf-8

# encoding: utf-8
        before :authenticate!
# encoding: utf-8

# encoding: utf-8
        expose :current_user
# encoding: utf-8
        expose :authenticated
# encoding: utf-8
        expose :csrf
# encoding: utf-8
      end
# encoding: utf-8

# encoding: utf-8
      view.prepare do
# encoding: utf-8
        include Web::Helpers::Translate
# encoding: utf-8
        include Web::Helpers::Links
# encoding: utf-8
        include Web::Presenters
# encoding: utf-8
      end
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    ##
# encoding: utf-8
    # DEVELOPMENT
# encoding: utf-8
    #
# encoding: utf-8
    configure :development do
# encoding: utf-8
      # Don't handle exceptions, render the stack trace
# encoding: utf-8
      handle_exceptions false
# encoding: utf-8

# encoding: utf-8
      # Serve static assets during development
# encoding: utf-8
      serve_assets      true
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    ##
# encoding: utf-8
    # TEST
# encoding: utf-8
    #
# encoding: utf-8
    configure :test do
# encoding: utf-8
      # Don't handle exceptions, render the stack trace
# encoding: utf-8
      handle_exceptions false
# encoding: utf-8

# encoding: utf-8
      # Serve static assets during development
# encoding: utf-8
      serve_assets      true
# encoding: utf-8
    end
# encoding: utf-8

# encoding: utf-8
    ##
# encoding: utf-8
    # PRODUCTION
# encoding: utf-8
    #
# encoding: utf-8
    configure :production do
# encoding: utf-8
    end
# encoding: utf-8
  end
# encoding: utf-8
end
