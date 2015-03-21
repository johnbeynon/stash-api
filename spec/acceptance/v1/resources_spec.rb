require "spec_helper"

describe Endpoints::V1::Resources do
  include Committee::Test::Methods
  include Rack::Test::Methods

  def app
    Routes
  end

  def schema_path
    "./schema/schema.json"
  end

  describe 'GET /resources' do
    it 'returns correct status code and conforms to schema' do
      get_v1_json '/resources'
      expect(last_response.status).to eq(200)
      assert_schema_conform
    end
  end

  describe 'POST /v1/resources' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      post '/resources', MultiJson.encode({title: 'A title', url: 'A url', collection_id: SecureRandom.uuid})
      expect(last_response.status).to eq(201)
      assert_schema_conform
    end
  end

  describe 'GET /resources/:id' do
    it 'returns correct status code and conforms to schema' do
      resource = create :resource
      get "/resources/#{resource.uuid}"
      expect(last_response.status).to eq(200)
      assert_schema_conform
    end
  end

  describe 'PATCH /v1/resources/:id' do
    it 'returns correct status code and conforms to schema' do
      resource = create :resource
      patch "/resources/#{resource.uuid}", MultiJson.encode({title: 'New Title'})
      expect(last_response.status).to eq(200)
      expect(Resource.last.title).to eq('New Title')
      assert_schema_conform
    end
  end

  describe 'DELETE /resources/:id' do
    it 'returns correct status code and conforms to schema' do
      delete '/resources/123'
      expect(last_response.status).to eq(200)
      assert_schema_conform
    end
  end
end
