echo "Installing IIS 8.5, could take a while..."
import-module servermanager
add-windowsfeature web-server -includeallsubfeature

echo "Done installing IIS"
