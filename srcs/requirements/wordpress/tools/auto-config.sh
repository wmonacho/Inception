while [ ! -f /var/www/html/wordpress/wp-config.php ]
do
	sleep 2
done

cd /var/www/html/wordpress/
# wp config create	--allow-root \
# 					--dbname=$SQL_DATABASE \
# 					--dbuser=$SQL_USER \
# 					--dbpass=$SQL_PASSWORD \
# 					--dbhost=mariadb:3306 --path='/var/www/html/wordpress'
wp core install --locale=en_US --title=$WP_TITLE --admin_user=$WP_USER_ADMIN --admin_password=$WP_USER_ADMIN_PASS --admin_email=$WP_USER_ADMIN_EMAIL --url=$WP_URL --allow-root
wp user login $WP_USER_ADMIN --password=$WP_USER_ADMIN_PASS --allow-root
wp user create biensepasser biensepasser@laposte.net --user_pass=biensepasser2.0 --allow-root

# mkdir -p /run/php/
php-fpm7.3 -F