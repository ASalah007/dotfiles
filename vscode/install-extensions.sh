#!/bin/bash

# Define color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Initialize counters
success_count=0
failure_count=0

# Loop through each line in the extensions.txt file
while IFS= read -r extension; do
  if [[ -n "$extension" ]]; then
    echo "Installing extension: $extension"
    if code --install-extension "$extension" &> /dev/null; then
      echo -e "${GREEN}Successfully installed: $extension${NC}"
      ((success_count++))
    else
      echo -e "${RED}Failed to install: $extension${NC}"
      ((failure_count++))
    fi
  fi
done < extensions.txt

echo 
echo -e "${GREEN}Succeeded: ${success_count}${NC}"
echo -e "${RED}Failed: ${failure_count}${NC}"

exit 0