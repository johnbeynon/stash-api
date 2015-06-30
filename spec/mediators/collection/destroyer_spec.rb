require "spec_helper"

describe Mediators::Collection::Destroyer do

  let(:collection) { create :collection }
  let(:mediator) { described_class.new(collection.uuid) }

  it 'deletes the collection' do
    allow_any_instance_of(Collection).to receive(:destroy)
    mediator.call
  end

  it 'does not delete if open resources are present' do
    resource = create :resource
    collection.add_resource resource
    expect{mediator.call}.to raise_error Pliny::Errors::UnprocessableEntity
  end

end
