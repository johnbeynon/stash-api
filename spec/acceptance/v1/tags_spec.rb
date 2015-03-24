require "spec_helper"

describe Endpoints::V1::Tags do
  include Committee::Test::Methods
  include Rack::Test::Methods

  def app
    Routes
  end

  def schema_path
    "./schema/schema.json"
  end

  describe 'GET /v1/tags' do
    it 'returns correct status code and conforms to schema' do
      get '/v1/tags'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'POST /v1/tags' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      post '/v1/tags', MultiJson.encode({})
      assert_equal 201, last_response.status
      assert_schema_conform
    end
  end

  describe 'GET /v1/tags/:id' do
    it 'returns correct status code and conforms to schema' do
      get "/v1/tags/123"
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'PATCH /v1/tags/:id' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      patch '/v1/tags/123', MultiJson.encode({})
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'DELETE /v1/tags/:id' do
    it 'returns correct status code and conforms to schema' do
      delete '/v1/tags/123'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end
end
