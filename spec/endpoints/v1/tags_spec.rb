require "spec_helper"

describe Endpoints::V1::Tags do
  include Rack::Test::Methods

  describe "GET /v1/tags" do
    it "succeeds" do
      get "/v1/tags"
      assert_equal 200, last_response.status
    end
  end
end
