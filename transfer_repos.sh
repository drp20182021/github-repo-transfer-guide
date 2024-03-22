#!/bin/bash

# Replace ORGANIZATION_NAME with your new organization's name
ORGANIZATION_NAME="Your-New-Organization-Name"

# Loop through each line in repos.txt
while IFS= read -r repo; do
  gh api -X POST /repos/$USER/$repo/transfer -F new_owner=$ORGANIZATION_NAME
done < repos.txt
