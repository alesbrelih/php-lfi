FROM php:8.3-apache

ENV APACHE_LOG_DIR /var/log/apache2

# Hack to remove symlink to /dev/stdout which is used in php:8.3-apache
RUN rm -f "$APACHE_LOG_DIR/error.log" && \
	rm -f "$APACHE_LOG_DIR/access.log" && \
	rm -f "$APACHE_LOG_DIR/other_vhosts_access.log" && \
	touch "$APACHE_LOG_DIR/error.log" && \
	touch "$APACHE_LOG_DIR/access.log" && \
	touch "$APACHE_LOG_DIR/other_vhosts_access.log" && \
	chown www-data:www-data "$APACHE_LOG_DIR/error.log" && \
	chown www-data:www-data "$APACHE_LOG_DIR/access.log" && \
	chown www-data:www-data "$APACHE_LOG_DIR/other_vhosts_access.log" && \
	chmod 644 "$APACHE_LOG_DIR/error.log" && \
	chmod 644 "$APACHE_LOG_DIR/access.log" && \
	chmod 644 "$APACHE_LOG_DIR/other_vhosts_access.log"
