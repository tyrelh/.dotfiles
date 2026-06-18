CONFIG_DIR="$HOME/.config/zed"
CONFIG_FILE="settings.json"
KEYMAP_FILE="keymap.json"

mkdir -p "$CONFIG_DIR"
if [ -f "$CONFIG_DIR/$CONFIG_FILE" ]; then
    echo "backing up existing file $CONFIG_DIR/$CONFIG_FILE"
    mv "$CONFIG_DIR/$CONFIG_FILE" "$CONFIG_DIR/$CONFIG_FILE.bak"
fi
if [ -f "$CONFIG_DIR/$KEYMAP_FILE" ]; then
    echo "backing up existing file $CONFIG_DIR/$KEYMAP_FILE"
    mv "$CONFIG_DIR/$KEYMAP_FILE" "$CONFIG_DIR/$KEYMAP_FILE.bak"
fi
echo "linking $(pwd)/$CONFIG_FILE to $CONFIG_DIR/$CONFIG_FILE"
ln "$CONFIG_FILE" "$CONFIG_DIR/$CONFIG_FILE"
echo "linking $(pwd)/$KEYMAP_FILE to $CONFIG_DIR/$KEYMAP_FILE"
ln "$KEYMAP_FILE" "$CONFIG_DIR/$KEYMAP_FILE"
