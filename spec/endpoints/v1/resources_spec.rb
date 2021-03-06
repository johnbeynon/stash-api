require "spec_helper"

describe Endpoints::V1::Resources do
  include Rack::Test::Methods

  # /resources URLs
  describe "GET /resources/:resource_id" do
    before do 
      @resource = create :resource
      token_request
    end

    it "succeeds" do
      get_v1_json "/resources/#{@resource.uuid}"
      expect(last_response.status).to eq(200)
    end

    it "returns a 404 if not a UUID" do
      get_v1_json "/resources/1234"
      expect(last_response.status).to eq(404)
    end

    it "returns a 404 if not found" do
      @uuid = SecureRandom.uuid
      get_v1_json "/resources/#{@uuid}"
      expect(last_response.status).to eq(404)
    end
  end

  describe "PATCH /resources/:resource_id" do
  end
  
  describe "DELETE /resources/:resource_id" do
  end

  # /tags URLS
  describe "GET /tags/:tag_id/resources" do
  end

  # /collections URLs
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

  describe "POST /collection/:collection_id/resources" do

    before do
      @collection = create :collection
      token_request
    end

    it "succeeds with just a URL" do
      post_v1_json "/collections/#{@collection.uuid}/resources", {
        url: 'http://www.example.com'
      }
      expect(last_response.status).to eq(201)
    end
  end
end
