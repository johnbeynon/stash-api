class Tag < Sequel::Model
  plugin :timestamps
  plugin :paranoid, enable_default_scope: true
  plugin :validation_helpers

  many_to_one :collection
  many_to_many :resources, left_key: :tag_id, right_key: :resource_id, left_primary_key: :uuid

  def validate
    super
    validates_presence [:name, :collection_id]
    validates_unique(:name) do |ds|
      ds.where(collection_id: self.collection_id) 
    end
  end

  def before_create
    self.slug = name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '') if slug.nil?
  end
end
