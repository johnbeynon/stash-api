require "spec_helper"

describe Endpoints::V1::Resources do
  include Committee::Test::Methods
  include Rack::Test::Methods

  before do
    token_request
  end

  def app
    Routes
  end

  def schema_path
    "./docs/schema/api.json"
  end

  describe 'POST /collections/:collection_id/add' do
    it 'returns correct status code and conforms to schema' do
      collection = create :collection
      post_v1_json "/collections/#{collection.uuid}/add", {
        title: "A Title",
        url: "http://www.example.com",
        tags: []
      }
      expect(last_response.status).to eq(201)
      assert_schema_conform
    end
  end

  describe 'GET /resources/:id' do
    it 'returns correct status code and conforms to schema' do
      resource = create :resource
      tag = create :tag
      resource.add_tag tag
      get_v1_json "/resources/#{resource.uuid}"
      expect(last_response.status).to eq(200)
      assert_schema_conform
    end
  end

  describe 'PATCH /resources/:id' do
    it 'returns correct status code and conforms to schema' do
      resource = create :resource
      patch_v1_json "/resources/#{resource.uuid}", {
        title: 'New Title'
      }
      expect(last_response.status).to eq(200)
      expect(Resource.last.title).to eq('New Title')
      assert_schema_conform
    end
  end

  describe 'DELETE /resources/:id' do
    it 'returns correct status code and conforms to schema' do
      delete_v1_json '/resources/123'
      expect(last_response.status).to eq(200)
      assert_schema_conform
    end
  end
end
