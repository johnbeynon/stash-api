require "spec_helper"

describe Endpoints::V1::Tags do
  include Committee::Test::Methods
  include Rack::Test::Methods

  def app
    Routes
  end

  def schema_path
    "./docs/schema/api.json"
  end

  describe 'POST /tags' do
    it 'returns correct status code and conforms to schema' do
      post_v1_json '/tags', MultiJson.encode({name: 'New Tag'})
      expect(last_response.status).to eq(201)
      assert_schema_conform
    end
  end

  describe 'GET /tags/:id' do
    it 'returns correct status code and conforms to schema' do
      tag = create :tag
      get_v1_json "/tags/#{tag.uuid}"
      expect(last_response.status).to eq(200)
      assert_schema_conform
    end
  end

  describe 'PATCH /v1/tags/:id' do
    it 'returns correct status code and conforms to schema' do
      tag = create :tag
      patch_v1_json "/tags/#{tag.uuid}", MultiJson.encode({name: 'New Name'})
      expect(last_response.status).to eq(200)
      assert_schema_conform
    end
  end

  describe 'DELETE /tags/:id' do
    it 'returns correct status code and conforms to schema' do
      tag = create :tag
      delete_v1_json "/tags/#{tag.uuid}"
      expect(last_response.status).to eq(200)
      assert_schema_conform
    end
  end
end
