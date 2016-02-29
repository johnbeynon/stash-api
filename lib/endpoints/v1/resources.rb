module Endpoints::V1
  class Resources < Base

    UUID_PATTERN = /\A[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}\Z/

    namespace "/resources" do

      get "/:id" do
        raise Pliny::Errors::NotFound unless UUID_PATTERN =~ params[:id]
        resource = Resource[params[:id]]
        raise Pliny::Errors::NotFound unless resource
        respond_with resource
      end

      patch "/:id" do
        respond_with Mediators::Resource::Updater.new(
          params[:id],
          request_body,
        ).call
      end

      delete "/:id" do
        encode Hash.new
      end
    end

    namespace '/collections' do

      post "/:collection_id/resources" do
        respond_with Mediators::Resource::Creator.new(
          collection_id,
          request_body
        ).call, 201
      end

      get '/:collection_id/resources' do
        raise Pliny::Errors::NotFound unless UUID_PATTERN =~ collection_id
        collection = Collection.find(uuid: collection_id)
        raise Pliny::Errors::NotFound if collection.nil?
        respond_with collection.resources
      end
    end

    namespace '/tags' do
      get '/:tag_id/resources' do
        @tag = Tag.find(uuid: params[:tag_id])
        raise Pliny::Errors::NotFound if @tag.nil?
        respond_with TagService.resources_in_tag(@tag)
      end
    end

    private

    def serializer
      Serializers::Resource.new(:default)
    end

    def collection_id
      params[:collection_id]
    end

  end
end
