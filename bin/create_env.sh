#!/usr/bin/env bash

# Define the filename
envfile='.env'

# generate a .env from the sample file
cp .env.sample $envfile

# Add the env variables to file

if [[ "$OSTYPE" == "darwin"* ]]; then
      sed -i '' "s|sample_username|${USERNAME}|g" $envfile
      sed -i '' "s|sample_host|${SERVER_HOST}|g" $envfile
      sed -i '' "s|sample_db_url|${DATABASE_URL}|g" $envfile
else
      sed -i "s|sample_username|${USERNAME}|g" $envfile
      sed -i "s|sample_host|${SERVER_HOST}|g" $envfile
      sed -i "s|sample_db_url|${DATABASE_URL}|g" $envfile
fi
