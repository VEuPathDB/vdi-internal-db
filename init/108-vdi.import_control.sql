CREATE TABLE IF NOT EXISTS vdi.import_control (
  dataset_id VARCHAR(32)
    NOT NULL
    UNIQUE
    REFERENCES vdi.datasets (dataset_id)
, status VARCHAR
    NOT NULL
);
