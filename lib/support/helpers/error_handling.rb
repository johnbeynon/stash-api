module Support::Helpers
  module ErrorHandling

    def log_exception(e, data={})
      data.merge!({
        exception: true,
        class: e.class.name,
        message: e.message
      })
      Pliny.log data
    end

    def render_error(message, options={})
      options[:id] ||= :application_error
      options[:status] ||= 500
      error_attrs = options[:metadata] || {}

      message = message.gsub(/\s*\n\s*/, " ")
      error_attrs.merge!(id: options[:id], message: message)
      error_attrs[:url] = options[:url] if options[:url]
      respond(error_attrs, status: options[:status])
    end

    def respond(object, options={})
      status(options[:status]) if options[:status]
      content_type(:json)
      MultiJson.dump(object)
    end

  end
end
