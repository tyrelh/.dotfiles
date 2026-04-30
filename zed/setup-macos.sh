CONFIG_DIR="$HOME/.config/zed"
CONFIG_FILE="settings.json"

mkdir -p "$CONFIG_DIR"
if [ -f "$CONFIG_DIR/$CONFIG_FILE" ]; then
    echo "backing up existing file $CONFIG_DIR/$CONFIG_FILE"
    mv "$CONFIG_DIR/$CONFIG_FILE" "$CONFIG_DIR/$CONFIG_FILE.bak"
fi
echo "linking $(pwd)/$CONFIG_FILE to $CONFIG_DIR/$CONFIG_FILE"
ln -s "$CONFIG_FILE" "$CONFIG_DIR/$CONFIG_FILE"
