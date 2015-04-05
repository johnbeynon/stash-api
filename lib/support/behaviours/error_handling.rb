module Support::Behaviours
  module ErrorHandling

    def self.registered(app)

      app.instance_eval do
        include Support::Helpers::ErrorHandling
      end

      app.error Pliny::Errors::Unauthorized, Excon::Errors::Unauthorized do
        respond({}, status: 401)
      end

      app.error Pliny::Errors::NotFound do
        respond({}, status: 404)
      end

      app.error Pliny::Errors::Forbidden do
        respond({}, status: 403)
      end

      app.error Pliny::Errors::PreconditionFailed do
        respond({}, status: 412)
      end

      app.error Sequel::ValidationFailed do
        e = env["sinatra.error"]
        log_exception(e)
        message = e.errors.full_messages.join("\n").inspect
        render_error(message, id: :invalid_params, status: 422)
      end

      app.error do
        e = env["sinatra.error"]
        log_exception(e)
        e = Pliny::Errors::InternalServerError.new
        render_error(e.message, status: 500)
      end

    end

  end
end
