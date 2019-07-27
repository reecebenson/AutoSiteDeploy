# Reece Benson - 2019
# Automatically remove all instances of a site in live, staging and
# development directories that follow the same structure as deploy.sh

echo "Enter the site name to remove:"
read SITE_NAME

rm /etc/sites/*/*.$SITE_NAME && rm -d /var/sites/.deploy/$SITE_NAME/ && rm -rf /var/sites/*/$SITE_NAME
echo "Cleaned up directories and nginx configuration for: $SITE_NAME"

echo "Restarting nginx (requires privileges)..."
sudo service nginx restart
echo "...complete"
