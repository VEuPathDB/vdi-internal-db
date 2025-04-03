/**
 * Dataset to Install Target Mapping
 *
 * Tracks the install targets for each dataset to allow the VDI REST API service
 * to perform quick lookups of datasets by project.
 */
CREATE TABLE IF NOT EXISTS vdi.dataset_projects (
  dataset_id VARCHAR(32)
    NOT NULL
    REFERENCES vdi.datasets (dataset_id)
    PRIMARY KEY
, project_id VARCHAR
    NOT NULL
, CONSTRAINT dataset_projects_uq UNIQUE (dataset_id, project_id)
);
