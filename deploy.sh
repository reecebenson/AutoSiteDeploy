echo "Please enter the site name:"
read SITE_NAME

cd /var/sites

# Make the development, staging and live structure
mkdir development/$SITE_NAME development/$SITE_NAME/logs development/$SITE_NAME/public
mkdir staging/$SITE_NAME staging/$SITE_NAME/logs staging/$SITE_NAME/public
mkdir live/$SITE_NAME live/$SITE_NAME/logs live/$SITE_NAME/public
echo "Created $SITE_NAME development, staging and live structures."
