module Web
  require 'rack/protection'
  require 'i18n'

  I18n.load_path = Dir["#{ __dir__ }/locales/*.yml"]
  I18n.backend.load_translations
  I18n.default_locale = :en

  class Application < Lotus::Application
    configure do
      ##
      # BASIC
      #

      root __dir__

      load_paths << [
        'mixins',
        'presenters',
        'controllers',
        'views'
      ]

      ##
      # HTTP
      #

      routes 'config/routes'

      # Configure Rack middleware for this application
      middleware.use Rack::Session::Cookie, secret: ENV['WEB_SESSIONS_SECRET']
      middleware.use Rack::Protection::IPSpoofing
      middleware.use Rack::Protection::SessionHijacking
      middleware.use Rack::Protection::PathTraversal
      middleware.use Rack::Protection::FrameOptions
      middleware.use Rack::Protection::RemoteReferrer
      middleware.use Rack::Protection::FormToken
      middleware.use Rack::Protection::JsonCsrf
      middleware.use Rack::Protection::RemoteToken
      middleware.use Rack::Protection::HttpOrigin

      # Default format for the requests that don't specify an HTTP_ACCEPT header
      default_format :html

      ##
      # TEMPLATES
      #

      # The layout to be used by all the views
      layout :application

      # The relative path where to find the templates
      #
      templates 'templates'

      ##
      # ASSETS
      #

      # Enabling serving assets
      serve_assets true

      controller.prepare do
        include Roberts::Model
        include Web::Mixins::Form
        include Web::Mixins::Session
        include Web::Mixins::Auth

        before :authenticate!

        expose :current_user
        expose :authenticated
        expose :csrf
      end

      view.prepare do
        include Web::Mixins::Translate
        include Web::Mixins::Links
        include Web::Presenters
      end
    end

    ##
    # DEVELOPMENT
    #
    configure :development do
      # Don't handle exceptions, render the stack trace
      handle_exceptions false

      # Serve static assets during development
      serve_assets      true
    end

    ##
    # TEST
    #
    configure :test do
      # Don't handle exceptions, render the stack trace
      handle_exceptions false

      # Serve static assets during development
      serve_assets      true
    end

    ##
    # PRODUCTION
    #
    configure :production do
    end
  end
end
