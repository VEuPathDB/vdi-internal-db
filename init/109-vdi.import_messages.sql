CREATE TABLE IF NOT EXISTS vdi.import_messages (
  dataset_id VARCHAR(16)
    UNIQUE
    NOT NULL
    REFERENCES vdi.datasets (dataset_id)
, message VARCHAR
    NOT NULL
);
