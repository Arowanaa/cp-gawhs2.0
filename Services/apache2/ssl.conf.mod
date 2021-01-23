<VirtualHost IP:443>
ServerAdmin admin@lastbreach.com
ServerName yourserversname

# Disable DocumentRoot if Proxy is used! (see below)
DocumentRoot /var/www/yourapp/

# SSL/TLS Settings - requires module "ssl"
SSLEngine on
SSLCertificateFile /etc/ssl/private/ssl-certificate.crt
SSLCertificateKeyFile /etc/ssl/private/ssl-certificate.key
SSLCACertificateFile /etc/ssl/private/cacert.pem

### Reverse Proxy Settings, requires modules "proxy" and "proxy_http"
### Apache can act as SSL/TLS proxy for your HTTP only applications.
#SSLProxyEngine On
#ProxyPreserveHost On
#ProxyRequests Off
#ProxyPass / http://host:port/
#ProxyPassReverse / http://host:port/

ErrorLog "|/usr/bin/logger -p local2.error -t apache"
CustomLog "|/usr/bin/logger -p local2.notice -t apache" common

# Header Settings - requires module "headers"
# If you use HTTPS and have a valid certificate, enabling HSTS is strongly advised! (15768000 seconds = 6 months)
Header always set Strict-Transport-Security "max-age=15768000"
# Depending on your setup, you might even want to go further than that and choose the following Header options instead.
# Header always set Strict-Transport-Security "max-age=15768000; includeSubdomains; preload"
# Note that includeSubdomains can cause trouble, if your subdomains are not running on HTTPS, use mixed-content or don't have a valid SSL/TLS certificate!
</VirtualHost>
