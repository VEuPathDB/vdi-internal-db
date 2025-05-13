CREATE TABLE IF NOT EXISTS vdi.import_control (
  dataset_id VARCHAR(16)
    NOT NULL
    UNIQUE
    REFERENCES vdi.datasets (dataset_id)
, status VARCHAR
    NOT NULL
);
