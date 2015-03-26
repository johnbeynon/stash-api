require "spec_helper"

describe Endpoints::V1::Collections do
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

  describe 'GET /v1/collections' do
    it 'returns correct status code and conforms to schema' do
      get_v1_json '/collections'
      expect(last_response.status).to eq(200)
      assert_schema_conform
    end
  end

  describe 'POST /v1/collections' do
    it 'returns correct status code and conforms to schema' do
      post '/collections', MultiJson.encode({name: 'A Collection'})
      expect(last_response.status).to eq(201)
      assert_schema_conform
    end
  end

  describe 'GET /v1/collections/:id' do
    it 'returns correct status code and conforms to schema' do
      collection = create :collection
      get "/collections/#{collection.uuid}"
      expect(last_response.status).to eq(200)
      assert_schema_conform
    end
  end

  describe 'PATCH /v1/collections/:id' do
    it 'returns correct status code and conforms to schema' do
      collection = create :collection
      patch "/collections/#{collection.uuid}", MultiJson.encode({name: 'New name'})
      expect(last_response.status).to eq(200)
      assert_schema_conform
    end
  end

  #describe 'DELETE /v1/collections/:id' do
  #  it 'returns correct status code and conforms to schema' do
  #    delete '/v1/collections/123'
  #    assert_equal 200, last_response.status
  #    assert_schema_conform
  #  end
  #end
end
