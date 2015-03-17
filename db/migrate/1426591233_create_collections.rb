Sequel.migration do
  change do
    create_table(:collections) do
      uuid         :uuid, default: Sequel.function(:uuid_generate_v4), primary_key: true
      String       :name
      timestamptz  :created_at, default: Sequel.function(:now), null: false
      timestamptz  :updated_at
    end
  end
end
