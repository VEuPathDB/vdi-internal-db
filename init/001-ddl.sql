CREATE SCHEMA IF NOT EXISTS vdi;

CREATE TABLE IF NOT EXISTS vdi.datasets (
  dataset_id CHAR(32)
    PRIMARY KEY
    NOT NULL
, type_name VARCHAR
    NOT NULL
, type_version VARCHAR
    NOT NULL
, owner_id VARCHAR
    NOT NULL
, is_deleted BOOLEAN
    NOT NULL
    DEFAULT FALSE
, created TIMESTAMP WITH TIME ZONE
    NOT NULL
    DEFAULT now()
);


CREATE TABLE IF NOT EXISTS vdi.dataset_files (
  dataset_id CHAR(32)
    NOT NULL
    REFERENCES vdi.datasets (dataset_id)
, file_name VARCHAR
    NOT NULL
, CONSTRAINT dataset_files_file_to_dataset_uq UNIQUE (dataset_id, file_name)
);


CREATE TABLE IF NOT EXISTS vdi.dataset_projects (
  dataset_id CHAR(32)
    NOT NULL
    REFERENCES vdi.datasets (dataset_id)
, project_id VARCHAR
    NOT NULL
, CONSTRAINT dataset_projects_uq UNIQUE (dataset_id, project_id)
);


CREATE TABLE IF NOT EXISTS vdi.dataset_metadata (
  dataset_id CHAR(32)
    NOT NULL
    UNIQUE
    REFERENCES vdi.datasets (dataset_id)
, name VARCHAR
    NOT NULL
, summary VARCHAR
, description VARCHAR
);

CREATE TABLE IF NOT EXISTS vdi.sync_control (
  dataset_id CHAR(32)
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

CREATE TABLE IF NOT EXISTS vdi.dataset_share_offers (
  dataset_id CHAR(32)
    NOT NULL
    REFERENCES vdi.datasets (dataset_id)
, recipient_id VARCHAR
    NOT NULL
, status VARCHAR
    NOT NULL
, CONSTRAINT owner_share_uq UNIQUE (dataset_id, recipient_id)
);

CREATE TABLE IF NOT EXISTS vdi.dataset_share_receipts (
  dataset_id CHAR(32)
    NOT NULL
    REFERENCES vdi.datasets (dataset_id)
, recipient_id VARCHAR
    NOT NULL
, status VARCHAR
    NOT NULL
, CONSTRAINT recipient_share_uq UNIQUE (dataset_id, recipient_id)
);

CREATE TABLE IF NOT EXISTS vdi.import_control (
  dataset_id CHAR(32)
    NOT NULL
    UNIQUE
    REFERENCES vdi.datasets (dataset_id)
, status VARCHAR
    NOT NULL
);
