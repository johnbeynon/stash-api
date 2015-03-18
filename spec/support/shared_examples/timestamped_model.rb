shared_examples "a timestamped model" do

  let(:thing){ create described_class.name.underscore.to_sym }

  it 'has timestamp methods' do
    expect(thing.respond_to? :created_at).to be true
    expect(thing.respond_to? :updated_at).to be true
  end

  it 'populates created_at' do
    expect(thing.created_at).to_not be nil
  end

  it 'populates updated_at on change' do
    expect(thing.updated_at).to be nil
    thing.save
    expect(thing.updated_at).to_not be nil
  end

end
