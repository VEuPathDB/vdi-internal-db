/**
 * Mutable Dataset Metadata
 *
 * Tracks additional user-provided metadata about a dataset that may be updated
 * by the owning user at any time.
 *
 * The metadata here is a copy of what is stored in the dataset's metadata file
 * in the source object store.  It is cached in this table for quick lookup by
 * the HTTP REST API.
 */
CREATE TABLE IF NOT EXISTS vdi.dataset_metadata (
  dataset_id VARCHAR(16)
    NOT NULL
    UNIQUE
    REFERENCES vdi.datasets (dataset_id)
, visibility VARCHAR
    NOT NULL
, name VARCHAR
    NOT NULL
, short_name VARCHAR
, short_attribution VARCHAR
, summary VARCHAR
, description VARCHAR
, source_url VARCHAR
);
