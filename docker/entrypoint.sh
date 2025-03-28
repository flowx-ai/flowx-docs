#!/bin/bash
set -e

# Load version information
VERSION=$(jq -r '.version' /docs-metadata/version.json)
echo "FlowX Documentation Version: ${VERSION}"

# Get output path from environment with fallback
OUTPUT_PATH=${DOCS_OUTPUT_PATH:-"/docs-data"}
echo "Copying documentation to: ${OUTPUT_PATH}"

# Ensure the output directory exists
mkdir -p ${OUTPUT_PATH}

# Copy the documentation to the output path
echo "Starting documentation copy..."
cp -r /docs-source/* ${OUTPUT_PATH}/
cp /docs-metadata/version.json ${OUTPUT_PATH}/
cp /docs-metadata/checksums.txt ${OUTPUT_PATH}/

# Create a version marker file
echo "${VERSION}" > ${OUTPUT_PATH}/.version

# Count files copied
FILE_COUNT=$(find ${OUTPUT_PATH} -type f | wc -l)
echo "Documentation copy complete. ${FILE_COUNT} files copied."

# Verify the copy by comparing file counts
SOURCE_COUNT=$(find /docs-source -type f | wc -l)
if [ $((SOURCE_COUNT + 2)) -ne ${FILE_COUNT} ]; then
    echo "Warning: Possible incomplete copy. Source: ${SOURCE_COUNT}, Destination: ${FILE_COUNT}"
else
    echo "Verification successful: All files copied correctly."
fi

# Create a status file with timestamp
cat > ${OUTPUT_PATH}/.status.json << EOL
{
  "version": "${VERSION}",
  "copied_at": "$(date -u +"%Y-%m-%dT%H:%M:%SZ")",
  "files_count": ${FILE_COUNT},
  "status": "complete"
}
EOL

echo "Documentation successfully deployed to ${OUTPUT_PATH}"
exit 0