#!/bin/sh
set -e

# Load camera configuration
if [ ! -f cameras.conf ]; then
    echo "Error: cameras.conf not found." >&2
    exit 1
fi
. ./cameras.conf

# --- Generate docker-compose.override.yml --- #
OVERRIDE_FILE="docker-compose.override.yml"

echo "services:" > "$OVERRIDE_FILE"

for cam in $ENABLED_CAMERAS; do
    # Convert camera name to uppercase for variable lookup (e.g., c110 -> C110)
    cam_upper=$(echo "$cam" | tr 'a-z' 'A-Z')
    var_name="${cam_upper}_RTSP_URL"
    eval url=\$$var_name

    if [ -z "$url" ]; then
        echo "Warning: RTSP URL for $cam not found in cameras.conf. Skipping." >&2
        continue
    fi

    # Append the service definition to the override file
    cat << EOF >> "$OVERRIDE_FILE"
  camera_$cam:
    container_name: camera_$cam
    build: ./camera
    environment:
      RTMP_SERVER_URL: "rtmp://nginx_rtmp:1935/livecam"
      STREAM_NAME: "$cam"
      RTSP_URL: "$url"
    restart: always
    depends_on:
      - nginx_rtmp
EOF
done

echo "Generated docker-compose.override.yml"

# --- Generate index.html from template --- #
TEMPLATE_FILE="data/index.html.template"
OUTPUT_HTML="data/index.html"

if [ ! -f "$TEMPLATE_FILE" ]; then
    echo "Error: $TEMPLATE_FILE not found." >&2
    exit 1
fi

# Create a JavaScript array string from the list of cameras (safer way)
JS_CAMERA_LIST=""
first=true
for cam in $ENABLED_CAMERAS; do
    if [ "$first" = true ]; then
        first=false
    else
        JS_CAMERA_LIST="$JS_CAMERA_LIST, "
    fi
    JS_CAMERA_LIST="$JS_CAMERA_LIST'$cam'"
done
JS_CAMERA_LIST="[$JS_CAMERA_LIST]"

# Replace the placeholder in the template and create the final index.html
TMP_FILE=$(mktemp)
sed "s/__CAMERAS_LIST__/$JS_CAMERA_LIST/g" "$TEMPLATE_FILE" > "$TMP_FILE"
mv "$TMP_FILE" "$OUTPUT_HTML"

# Set correct permissions for the web server to read the file
chmod 644 "$OUTPUT_HTML"

echo "Generated $OUTPUT_HTML"

# --- Start docker compose --- #
echo "Stopping existing services before starting..."
docker compose down

echo "Starting services..."
docker compose up -d --build

echo "Done."