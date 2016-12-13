#!/usr/bin/env bash
build_dir=`pwd`
docker run -v $build_dir/www:/var/www sminnee/silverstripe-lamp bash -c 'composer install; phpunit'