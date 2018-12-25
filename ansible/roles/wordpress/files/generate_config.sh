#!/bin/sh


CONFIG_FILE="/usr/local/www/wordpress/wp-config.php"


cat << EOF >"${CONFIG_FILE}"
<?php
define('DB_NAME', 'database_name_here');
define('DB_USER', 'username_here');
define('DB_PASSWORD', 'password_here');
define('DB_HOST', 'localhost');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

EOF
fetch -q -o - https://api.wordpress.org/secret-key/1.1/salt/ >>"${CONFIG_FILE}"

cat << EOF >>"${CONFIG_FILE}"

\$table_prefix  = 'wp_';

define('WP_DEBUG', false);

if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
EOF

echo -n "Change relevant info in /usr/local/www/wordpress/wp-config.php"
echo " before \"service php-fpm restart\""
