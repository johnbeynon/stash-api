class Tag < Sequel::Model
  plugin :timestamps
  plugin :paranoid, enable_default_scope: true
  plugin :validation_helpers

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
