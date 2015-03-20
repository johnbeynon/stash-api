require "spec_helper"

describe Resource do
  let(:resource) { build :resource }

  it_behaves_like 'a timestamped model'

  it 'requires a type' do
    resource.type = nil
    expect{ resource.save }.to raise_error Sequel::ValidationFailed, /type is not an allowed type/
  end

  it 'requires a collection_id' do
    resource.collection_id = nil
    expect{ resource.save }.to raise_error Sequel::ValidationFailed, /collection_id is not present/
  end

  it 'allows only specified types' do
    resource.type = "resource"
    expect{ resource.save}.to raise_error Sequel::ValidationFailed, /type is not an allowed type/
  end

end
