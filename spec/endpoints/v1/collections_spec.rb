require "spec_helper"

describe Endpoints::V1::Collections do
  include Rack::Test::Methods

  describe "GET /v1/collections" do
    it "succeeds" do
      get_v1_json "/collections"
      expect(last_response.status).to eq(200)
    end
  end
end
