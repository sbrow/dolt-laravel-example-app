# Usage

Bash setup:
```bash
# Alternatively, install php and composer manually
nix develop

dolt sql -q 'create database laravel;'
php artisan key:generate
php artisan migrate:fresh
php artisan db:seed
````
