Sequel.migration do
  change do
    create_table(:tags) do
      uuid         :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
      uuid         :collection_id, null: false
      String       :name, null: false
      timestamptz  :created_at, default: Sequel.function(:now), null: false
      timestamptz  :updated_at
      timestamptz  :deleted_at
    end
  end
end
