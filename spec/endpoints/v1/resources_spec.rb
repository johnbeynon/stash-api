require "spec_helper"

describe Endpoints::V1::Resources do
  include Rack::Test::Methods

  describe "GET /collections/:collection_id/resources" do

    before do
      @collection = create :collection
      link = create :resource, collection_id: @collection.uuid
      token_request
    end

    it "succeeds" do
      get_v1_json "/collections/#{@collection.uuid}/resources"
      expect(last_response.status).to eq(200)
    end

    it "returns a 404 if collection is not found" do
      get_v1_json "/collections/foo/resources"
      expect(last_response.status).to eq(404)
    end
  end
end
