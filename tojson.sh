#!/bin/bash

# Replace these filenames with the actual names of your .pem files
certificate_file="/path/to/certificate/file"
private_key_file="/path/to/privateKey/file"

# Read the contents of the .pem files
certificate_content=$(cat "$certificate_file")
private_key_content=$(cat "$private_key_file")

# Create a JSON object with certificate and private key data

json_data=$(jq -n \
  --arg tls_crt "$certificate_content" \
  --arg tls_key "$private_key_content" \
  '{"tls.crt": $tls_crt, "tls.key": $tls_key}')

# Print the JSON data
echo "$json_data"
