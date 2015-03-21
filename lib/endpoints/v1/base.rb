module Endpoints::V1
  class Base < Endpoints::Base

    before do
      content_type :json
    end

    def respond_with(object, status=200, serializer=nil)
      status status
      MultiJson.dump(serialize(object, serializer))
    end

    def serialize(obj, ser)
      (ser || serializer).serialize(obj)
    end

    def request_body
      @request_body ||= parse_json_body
      #@request_body.merge!({client_id: client_id}) unless client_id.nil?
      @request_body
    end

    def parse_json_body
      _body = request.body.read
      return {} if _body == "" or _body == "null"
      body = {}
      body = MultiJson.load(_body) unless _body == ""
      body.deep_symbolize_keys!
    end

  end
end
