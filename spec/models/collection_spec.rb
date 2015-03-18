require "spec_helper"

describe Collection do
  let(:collection) { build :collection }

  it_behaves_like 'a timestamped model'

  it 'requires a name' do
    collection.name = nil
    expect{ collection.save }.to raise_error Sequel::ValidationFailed, /name is not present/
  end

end
