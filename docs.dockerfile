FROM alpine:3.18 as build

# Build arguments and environment variables
ARG DOCS_VERSION=latest
ENV DOCS_VERSION=${DOCS_VERSION}
ENV DOCS_OUTPUT_PATH=/docs-data

# Install required dependencies
RUN apk add --no-cache bash jq

# Create directories
WORKDIR /app
RUN mkdir -p /docs-source /docs-metadata /docs-tmp

# Copy the documentation content
COPY . /docs-tmp

RUN (find . -type d -depth 1 | grep -E "^\.\/[0-9]+\." | xargs -I {} cp -r {} /docs-source) && \
rm -Rf /docs-tmp

# Copy version metadata
COPY version.json /docs-metadata/version.json

# Create checksum of all documentation files for verification
RUN find /docs-source -type f -exec sha256sum {} \; > /docs-metadata/checksums.txt

# Copy entrypoint script
COPY ./docker/entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Verify version info
RUN VERSION=$(jq -r '.version' /docs-metadata/version.json); \
    echo "Documentation Version: ${VERSION}"; \
    if [ "${VERSION}" = "null" ]; then \
        echo "Error: Invalid version in version.json"; \
        exit 1; \
    fi; \
    # Create a file in docs-source with the version
    echo "${VERSION}" > /docs-source/.version

# Default command
ENTRYPOINT ["/app/entrypoint.sh"]