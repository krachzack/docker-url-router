# docker-url-router
Simple URL router for docker based on the official httpd image.

This image extends `httpd:2.4-alpine` with a small script that automatically generates a vhosts configuration for apache that redirects subpaths to other images based on environment variables present at startup.

SSL modules are enabled per default. Automatically sets up a SSL vhost if certificate and private key are present in `/etc/apache2/ssl/cert` and `/etc/apache2/ssl/key`.

You can always override the apache configuration at `/usr/local/apache2/conf/httpd.conf`, just remember to include the automatially generated `/usr/local/apache2/conf/extra/httpd-vhosts.conf`.

# Example Configuration
It's neat for quickly setting up a docker-compose where one front server delegates sub-paths to other images.

    services:
      web:
        # ...
      assets:
        # ...
      router:
        image: durcheinander/router:1.1
        ports:
          - "80:80"
          - "443:443"
          - "48888:48888"
        volumes:
          # Optional, if files are present, HTTPS is enabled
          - "./ssl/kreit.localhost.crt:/etc/apache2/ssl/cert"
          - "./ssl/kreit.localhost.key:/etc/apache2/ssl/key"
        environment:
          # Should match certificate, if present, defaults to localhost if left out
          SERVER_NAME: "kreit.localhost"
          # Map /fileadmin/bundles/ and subdirectories to assets container, everything else to web container
          URL_MAPPINGS: "/fileadmin/bundles/=>http://assets:8080/fileadmin/bundles/  /=>http://web:9090/"
          # Also use the same mappings on port 48888
          EXTRA_PORTS: 48888
