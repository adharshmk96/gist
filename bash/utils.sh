#!/bin/bash

USERNAME="root"
IP="0.0.0.0"

# rsync files
git ls-files | rsync -avz --files-from=- ./ $USERNAME@$IP:sharepoint_storage_sync

# postgresql run sql script
docker container exec -it postgresdb psql -U postgresuser -d postgresuser -f truncate.sql

