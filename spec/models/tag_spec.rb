require "spec_helper"

describe Tag do
  let(:tag) { build :tag, name: 'A Slug' }

  it_behaves_like 'a timestamped model'

  it 'requires a name' do
    tag.name = nil
    expect{ tag.save }.to raise_error Sequel::ValidationFailed, /name is not present/
  end

  it 'requires a collection_id' do
    tag.collection_id = nil
    expect{ tag.save }.to raise_error Sequel::ValidationFailed, /collection_id is not present/
  end

  it 'sets the slug' do
    tag.save
    expect(tag.slug).to eq('a-slug')
  end
  
  it 'does not permit duplicate names per collection' do
    collection_id = SecureRandom.uuid
    tag = create :tag, name: 'A Slug', collection_id: collection_id 
    tag2 = build :tag, name: 'A Slug', collection_id: collection_id
    expect{ tag2.save }.to raise_error Sequel::ValidationFailed, /name is already taken/
  end
end
