require "spec_helper"

describe Collection do
  let(:collection) { build :collection }

  it 'requires a name' do
    collection.name = nil
    expect{ collection.save }.to raise_error #(Sequel::ValidationFailed, /name is not present/)
    #expect {}.to raise_error
    #xexpect(collection.name).to be_nil
  end
end
