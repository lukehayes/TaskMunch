echo "Warning: Script may need to be ran with sudo..."

TM_DIR="/usr/local/bin/taskmunch"

echo "Creating $TM_DIR..."
mkdir $TM_DIR

echo "copying tm executable over to $TM_DIR"
cp "tm" $TM_DIR

echo "copying taskmunch over to $TM_DIR"
cp -r "taskmunch" $TM_DIR

ls $TM_DIR

echo "--------------------------------------------"
echo "Don't forget to add taskmunch to your PATH!'"
echo "--------------------------------------------"

echo "Done."
