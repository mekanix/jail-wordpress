# jail-wordpress
Jail for Wordpress


```
fetch -q -o - https://api.wordpress.org/secret-key/1.1/salt/ >/usr/local/www/wordpress/wp-config-auth.php
cat << EOF >/usr/local/www/wordpress/wp-config.php
<?php
define('DB_NAME', 'database_name_here');
define('DB_USER', 'username_here');
define('DB_PASSWORD', 'password_here');
define('DB_HOST', 'localhost');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');

$table_prefix  = 'wp_';

define('WP_DEBUG', false);

if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-config-auth.php');
require_once(ABSPATH . 'wp-settings.php');
EOF
```
