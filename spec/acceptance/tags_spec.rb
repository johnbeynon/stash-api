require "spec_helper"

describe Endpoints::Tags do
  include Committee::Test::Methods
  include Rack::Test::Methods

  def app
    Routes
  end

  def schema_path
    "./schema/schema.json"
  end

  describe 'GET /tags' do
    it 'returns correct status code and conforms to schema' do
      get '/tags'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'POST /tags' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      post '/tags', MultiJson.encode({})
      assert_equal 201, last_response.status
      assert_schema_conform
    end
  end

  describe 'GET /tags/:id' do
    it 'returns correct status code and conforms to schema' do
      get "/tags/123"
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'PATCH /tags/:id' do
    it 'returns correct status code and conforms to schema' do
      header "Content-Type", "application/json"
      patch '/tags/123', MultiJson.encode({})
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end

  describe 'DELETE /tags/:id' do
    it 'returns correct status code and conforms to schema' do
      delete '/tags/123'
      assert_equal 200, last_response.status
      assert_schema_conform
    end
  end
end
