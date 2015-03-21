module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(last_response.body)
      if @json.is_a? Hash
        @json.deep_symbolize_keys!
      elsif @json.is_a? Array
        @json.collect{|x| x.deep_symbolize_keys!}
      end
    end

    def method_missing(meth, *args, &block)
      if meth.to_s =~ /^([a-z]+)_v(\d)_json$/
        send_http($1.to_sym, $2.to_s, args[0], args[1] || {}, args[2] || {})
      else
        super
      end
    end

    def send_http(method, version, uri, payload, headers)
      self.send(method, uri, payload.to_json, {
        "Content-Type" => "application/json",
        "Accept" => "application/vnd.stash+json; version=#{version.to_s}"
      }.merge(headers))
    end
  end
end
