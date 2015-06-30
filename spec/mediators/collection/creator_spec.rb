require "spec_helper"

describe Mediators::Collection::Creator do

  let(:mediator) {described_class.new(@params)}

  before do
    @params = {
      name: 'My Collection'
    }
  end

  it 'creates a collection' do
    collection = nil
    expect{collection = mediator.call}.to change(Collection, :count).by(1)
    expect(collection.name).to eq(@params[:name])
  end

end
