#!/bin/bash
chmod -R 777 var/www
chmod -R 777 pub/
php -d memory_limit=-1 bin/magento setup:upgrade
php -d memory_limit=-1 bin/magento indexer:reindex
php -d memory_limit=-1 bin/magento setup:static-content:deploy en_US
