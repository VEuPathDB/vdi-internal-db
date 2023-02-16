CREATE SCHEMA IF NOT EXISTS vdi;

CREATE TABLE IF NOT EXISTS vdi.datasets (
  dataset_id CHAR(32)
    PRIMARY KEY
    NOT NULL
, type_name VARCHAR
    NOT NULL
, type_version VARCHAR
    NOT NULL
, user_id BIGINT
    NOT NULL
, is_deleted BOOLEAN
    NOT NULL
    DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS vdi.sync_control (
  dataset_id CHAR(32)
    NOT NULL
    REFERENCES vdi.datasets (dataset_id)
, shares_update_time TIMESTAMP WITH TIME ZONE
    NOT NULL
, data_update_time TIMESTAMP WITH TIME ZONE
    NOT NULL
, meta_update_time TIMESTAMP WITH TIME ZONE
    NOT NULL
);

CREATE TYPE share_grant_status AS ENUM ('grant', 'revoke');
CREATE TYPE share_receipt_status AS ENUM ('accept', 'reject');

CREATE TABLE IF NOT EXISTS vdi.owner_share (
  dataset_id CHAR(32)
    NOT NULL
    REFERENCES vdi.datasets (dataset_id)
, shared_with BIGINT
    NOT NULL
, status share_grant_status
    NOT NULL
);

CREATE TABLE IF NOT EXISTS vdi.recipient_share (
  dataset_id CHAR(32)
    NOT NULL
    REFERENCES vdi.datasets (dataset_id)
, shared_with BIGINT
    NOT NULL
, status share_receipt_status
    NOT NULL
);