sleep 10
wp config create	--allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'
wp core install
wp user create

mkdir -p /run/php/
php-fpm7.3 -F