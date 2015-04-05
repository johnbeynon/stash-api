module Middleware
  class CorsExposeHeaders

    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)
      headers.merge!(additional_headers(headers))
      [status, headers, response]
    end

    private
    def additional_headers(headers)
      expose_headers = (headers['Access-Control-Expose-Headers'] || '').split(',')
      allow_headers = (headers['Access-Control-Allow-Headers'] || '').split(',')

      {
        'Access-Control-Expose-Headers' => (expose_headers + ['Etag']).join(','),
        'Access-Control-Allow-Headers' => (allow_headers + ['If-Match']).join(',')
      }
    end
  end
end
