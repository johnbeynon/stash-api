class LinkCallbacks
  include Sidekiq::Worker

  def perform(resource_id)
    resource = Resource.where(uuid: resource_id).first
    stack.call(resource) unless resource.nil?
  end

  private

  def stack
    @stack ||= Middleware::Builder.new do
      use Callbacks::Retriever
    end
  end
end
