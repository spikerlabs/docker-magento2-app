#!/bin/bash
mkdir ./magento2_preinstall_wip
cd ./magento2_preinstall_wip
composer create-project \
    --repository-url=https://repo.magento.com/ magento/project-$M2_EDITION . $M2_VERSION \
    --prefer-dist --no-install
composer install
mv ./.* ..
mv ./* ..
cd ..
rmdir ./magento2_preinstall_wip
chmod +x bin/magento
bin/magento setup:install \
  --backend-frontname=admin \
  --db-host=$M2_DB_HOST \
  --db-name=$M2_DB_NAME \
  --db-user=$M2_DB_USERNAME \
  --db-password=$M2_DB_PASSWORD \
  --base-url=$M2_BASE_URL \
  --use-rewrites=1 \
  --admin-user=$M2_ADMIN_USER \
  --admin-password=$M2_ADMIN_PASSWORD \
  --admin-email=$M2_ADMIN_EMAIL \
  --admin-firstname=$M2_ADMIN_FIRSTNAME \
  --admin-lastname=$M2_ADMIN_LASTNAME \
  --cleanup-database \
  --use-sample-data
bin/magento sampledata:deploy
