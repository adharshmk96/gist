#!/bin/bash

git ls-files | rsync -avz --files-from=- . user@host:target_dir


