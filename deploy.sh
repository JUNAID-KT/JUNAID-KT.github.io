# #!/bin/bash
# set -x
# # Set FTP server details
# FTP_SERVER="185.27.134.11"
# FTP_USERNAME="epiz_34352461"
# FTP_PASSWORD="feF3CjrtzimSi"

# # Files or folders to exclude (separated by space)
# EXCLUDE_LIST="./.github deploy.sh"

# # Connect to FTP server and upload files and folders to htdocs directory
# for item in *; do
#   if [[ ! " $EXCLUDE_LIST " =~ " $item " ]]; then
#     # Check if the item is a directory
#     if [ -d "$item" ]; then
#       curl --ftp-pasv -X MKCOL "ftp://$FTP_SERVER/htdocs/$item" --user "$FTP_USERNAME:$FTP_PASSWORD"
#     else
#       curl --ftp-pasv -T "$item" "ftp://$FTP_SERVER/htdocs/$item" --user "$FTP_USERNAME:$FTP_PASSWORD"
#     fi
#   fi
# done

# # #!/bin/bash

# # # Set FTP server details
# # FTP_SERVER="185.27.134.11"
# # FTP_USERNAME="epiz_34352461"
# # FTP_PASSWORD="feF3CjrtzimSi"

# # # Files or folders to exclude (separated by space)
# # EXCLUDE_LIST="./.github deploy.sh"

# # # Convert EXCLUDE_LIST to an array
# # IFS=' ' read -ra EXCLUDE_ARRAY <<< "$EXCLUDE_LIST"

# # # Connect to FTP server and upload files and folders to htdocs directory
# # for item in *; do
# #   excluded=false

# #   # Check if the item should be excluded
# #   for excluded_item in "${EXCLUDE_ARRAY[@]}"; do
# #     if [[ $item == $excluded_item ]]; then
# #       excluded=true
# #       break
# #     fi
# #   done

# #   if [[ ! $excluded ]]; then
# #     # Check if the item is a directory
# #     if [ -d "$item" ]; then
# #       curl --ftp-pasv -X MKCOL "ftp://$FTP_SERVER/htdocs/$item" --user "$FTP_USERNAME:$FTP_PASSWORD"
# #     else
#       curl --ftp-pasv -T "$item" "ftp://$FTP_SERVER/htdocs/$item" --user "$FTP_USERNAME:$FTP_PASSWORD"
#     fi
#   fi
# done

#!/bin/bash
set -x
# Set FTP server details
FTP_SERVER="185.27.134.11"
FTP_USERNAME="epiz_34352461"
FTP_PASSWORD="feF3CjrtzimSi"

# Files or folders to exclude (separated by space)
EXCLUDE_LIST="./.github deploy.sh"

# Connect to FTP server and upload files and folders to htdocs directory
for item in *; do
  if [[ ! " $EXCLUDE_LIST " =~ " $item " ]]; then
    # Check if the item is a directory
    if [ -d "$item" ]; then
      ncftpput -R -u "$FTP_USERNAME" -p "$FTP_PASSWORD" "$FTP_SERVER" "/htdocs/$item" "$item"
    else
      curl --ftp-pasv -T "$item" "ftp://$FTP_SERVER/htdocs/$item" --user "$FTP_USERNAME:$FTP_PASSWORD"
    fi
  fi
done


