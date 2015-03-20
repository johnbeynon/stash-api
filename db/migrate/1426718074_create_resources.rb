Sequel.migration do
  change do
    create_table(:resources) do
      uuid         :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
      String       :type, null: false
      String       :title
      String       :url
      Text         :excerpt
      Integer      :response_code
      uuid         :collection_id, null: false
      timestamptz  :created_at, default: Sequel.function(:now), null: false
      timestamptz  :updated_at
    end
  end
end
