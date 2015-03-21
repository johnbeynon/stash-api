require 'sidekiq/web'

Routes = Rack::Builder.new do
#  use Rollbar::Middleware::Sinatra
  use Pliny::Middleware::RescueErrors, raise: Config.raise_errors?
  use Pliny::Middleware::CORS
  use Pliny::Middleware::RequestID
  use Pliny::Middleware::RequestStore, store: Pliny::RequestStore
  use Pliny::Middleware::Timeout, timeout: Config.timeout if Config.timeout > 0
  use Pliny::Middleware::Versioning,
      default: Config.versioning_default,
      app_name: Config.versioning_app_name if Config.versioning?
  use Rack::Deflater
  use Rack::MethodOverride
  use Rack::SSL if Config.force_ssl?

  map '/sidekiq' do use Rack::Auth::Basic, "Protected Area" do |username, password|
      username == ENV["SIDEKIQ_USER"] && password == ENV["SIDEKIQ_PASSWORD"]
    end
    run Sidekiq::Web
  end

  use Pliny::Router do
    version "1" do
      mount Endpoints::V1::Collections
      mount Endpoints::V1::Resources
    end
  end

  # root app; but will also handle some defaults like 404
  run Endpoints::Root
end
