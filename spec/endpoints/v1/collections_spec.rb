require "spec_helper"

describe Endpoints::V1::Collections do
  include Rack::Test::Methods

  before do
    @collection = create :collection
    token_request
  end

  describe "GET /collections" do
    it "gets a list of collections" do
      get_v1_json "/collections"
      expect(last_response.status).to eq(200)
      expect(json.size).to eq(1)
    end
  end

  describe "GET /collections/:id" do
    it "gets a single collection" do
      get_v1_json "/collections/#{@collection.uuid}"
      expect(last_response.status).to eq(200)
    end
  end

  describe "POST /collections" do
    it "creates a new collection" do
      post_v1_json "/collections", {
        name: 'Another collection'
      }
      expect(last_response.status).to eq(201)
    end
  end

  describe "PATCH /collections/:id" do
    it "updates name" do
      patch_v1_json "/collections/#{@collection.uuid}", {
        name: 'Updated Collection'
      }
      expect(last_response.status).to eq(200)
    end
  end

end
