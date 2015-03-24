require "spec_helper"

describe Endpoints::Tags do
  include Rack::Test::Methods

  describe "GET /tags" do
    it "succeeds" do
      get "/tags"
      assert_equal 200, last_response.status
    end
  end
end
