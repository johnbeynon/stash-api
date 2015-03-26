module Middleware
  class TokenAuthenticator

    UnprocessableHeader = Class.new(ArgumentError)

    def initialize(app)
      @app = app
    end

    def call(env)
      @env = env

      if token
        if authed?
          set_authed
          @app.call(env)
        else
          Rack::Response.new("Unauthorized", 401)
        end
      else
        @app.call(env)
      end
    end

    private

    def authed?
      @token == ENV['AUTH_TOKEN'] ? true : false
    end
    
    def set_authed
      @env["authed"] = true
    end

    def token
      @token ||= token_and_options(@env["HTTP_AUTHORIZATION"]).first
    end

    def token_and_options(header)
      token = header.to_s.match(/^Token (.*)/) { |m| m[1] }
      if token
        begin
          values = Hash[token.split(',').map do |value|
            value.strip!                      # remove any spaces between commas and values
            key, value = value.split(/\=\"?/) # split key=value pairs
            value ||= ''
            value.chomp!('"')                 # chomp trailing " in value
            value.gsub!(/\\\"/, '"')          # unescape remaining quotes
            [key, value]
          end]
          [values.delete("token"), values]
        rescue => error
          raise UnprocessableHeader, error
        end
      else
        [nil,{}]
      end
    end


  end
end
