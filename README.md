# AutoSiteDeployment

A basic and simplistic way of generating development, staging and live environments on one nginx server configuration.

## Getting Started

These instructions will get you a copy of the automated deployment project up and running on your Linux machine.

### Prerequisites

What things you need to install the software and how to install them

```
-- nginx 1.14.0 or above --

$ sudo apt update
$ sudo apt install nginx -y
```

### File Structure

This project follows the file structure of:

```
├┬ /var/sites/
│ └┬ development
│   ├ staging
│   └ live
│
└┬ /etc/sites/
  └┬ development/
    ├ staging/
    └ live/
```

## Setup

If you haven't already got the file structure as listed above, please create the missing directories.

#### Set up nginx configuration to read from /etc/sites

```bash
sudo nano /etc/nginx/nginx.conf
```

Within http {...}, underneath the title of "Virtual Host Configs" add:

```bash
include /etc/sites/*/*;
```

Clone this repository, and then copy the contents of the created directory (`AutoSiteDeploy`) to `/var/sites`:

```bash
# Clone repository
cd /path/to
git clone https://github.com/reecebenson/AutoSiteDeploy.git

# Move contents
mv /path/to/AutoSiteDeploy/* /var/sites

# If the . files do not move, use the below commands
mv /path/to/AutoSiteDeploy/.deploy/ /var/sites
mv /path/to/AutoSiteDeploy/.git/ /var/sites
mv /path/to/AutoSiteDeploy/.gitignore /var/sites
```

### Nginx Configuration

Please ensure that the Nginx configuration matches your requirements, feel free to edit the default `.deploy/nginxsite` file to your liking but maintain the practices for:

```bash
server {
    ...

    server_name SITEURL www.SITEURL;
    root /var/sites/SITETYPE/SITENAME/public;

    ...

    error_log /var/sites/SITETYPE/SITENAME/logs/error.log;
    access_log /var/sites/SITETYPE/SITENAME/logs/access.log;

    ...
}
```

The nginx configuration is set to be connected to PHP 7.2's FPM socket, you can configure that in the above file.

```bash
server {
    ...

    fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;

    ...
}
```

## Usage

#### Create development, staging and live environments

> This creates the following directories & files:
> - `/var/sites/{ development, staging, live }/{ logs, public }/`
> - `/etc/sites/{ development, staging, live}/{ dev, stg, live }.{ sitename }`

```bash
$ ./deploy.sh

Please enter the site name:
> example

Please enter the site URL:
> example.com
```

#### Delete development, staging and live environments

> This cleans up files within:
> - `/var/sites/{ development, staging, live }`
> - `/etc/sites/{ development, staging, live}/{ dev, stg, live }.{ sitename }`

```bash
$ ./remove.sh

Please enter the site name:
> example
```

## Authors

* **Reece Benson** - [@reecebenson](https://github.com/reecebenson)

See also the list of [contributors](https://github.com/reecebenson/AutoSiteDeploy/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

