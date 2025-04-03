CREATE TABLE IF NOT EXISTS vdi.sync_control (
  dataset_id VARCHAR(32)
    NOT NULL
    UNIQUE
    REFERENCES vdi.datasets (dataset_id)
, shares_update_time TIMESTAMP WITH TIME ZONE
    NOT NULL
, data_update_time TIMESTAMP WITH TIME ZONE
    NOT NULL
, meta_update_time TIMESTAMP WITH TIME ZONE
    NOT NULL
);
