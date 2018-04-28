FROM httpd:2.4-alpine
MAINTAINER Philipp Stadler <hello@phstadler.com>

RUN mkdir -p /var/www/html/

RUN /bin/sed -i '/LoadModule ssl_module modules\/mod_ssl.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule watchdog_module modules\/mod_watchdog.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule slotmem_shm_module modules\/mod_slotmem_shm.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule xml2enc_module modules\/mod_xml2enc.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule proxy_module modules\/mod_proxy.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule proxy_http_module modules\/mod_proxy_http.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule proxy_html_module modules\/mod_proxy_html.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule proxy_module modules\/mod_proxy.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule proxy_connect_module modules\/mod_proxy_connect.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule proxy_ftp_module modules\/mod_proxy_ftp.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule proxy_http_module modules\/mod_proxy_http.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule proxy_fcgi_module modules\/mod_proxy_fcgi.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule proxy_scgi_module modules\/mod_proxy_scgi.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule proxy_uwsgi_module modules\/mod_proxy_uwsgi.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule proxy_fdpass_module modules\/mod_proxy_fdpass.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule proxy_wstunnel_module modules\/mod_proxy_wstunnel.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule proxy_ajp_module modules\/mod_proxy_ajp.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule proxy_balancer_module modules\/mod_proxy_balancer.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule proxy_express_module modules\/mod_proxy_express.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule proxy_hcheck_module modules\/mod_proxy_hcheck.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/LoadModule proxy_http2_module modules\/mod_proxy_http2.so/s/^#//g' /usr/local/apache2/conf/httpd.conf && \
    /bin/sed -i '/Include conf\/extra\/httpd-vhosts.conf/s/^#//g' /usr/local/apache2/conf/httpd.conf


ADD run_router /bin/run_router

# Write config, start apache and restart it when it crashes
CMD /bin/run_router
