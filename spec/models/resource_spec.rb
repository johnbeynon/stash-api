require "spec_helper"

describe Resource do
  let(:resource) { build :resource }

  it_behaves_like 'a timestamped model'

  it 'requires a name' do
    resource.name = nil
    expect{ resource.save }.to raise_error Sequel::ValidationFailed, /name is not present/
  end

  it 'requires a type' do
    resource.type = nil
    expect{ resource.save }.to raise_error Sequel::ValidationFailed, /type is not present/
  end

end
