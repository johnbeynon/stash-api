Sequel.migration do
  up do
    add_column :tags, :slug, String
  end

  down do
    drop_column :tags, :slug
  end
end
