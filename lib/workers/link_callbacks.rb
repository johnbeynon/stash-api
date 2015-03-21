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
      #use Callbacks::Kokyaku
      #use Callbacks::PagerDuty
      #use Callbacks::TamifyTicket
      #use Callbacks::RunRate
      #use Callbacks::OutageDetection
      #use Callbacks::ViewCount
      #use Callbacks::SearchIndexer
    end
  end
end
