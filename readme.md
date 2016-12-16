##SilverStripe Boilerplate Docker environment

Use this boilerplate to quickly get started with a new silverstripe site using Docker containers. Also works for other PHP 5.6 sites

###Requirements

* Docker
* Docker-compose
* docker user needs to have sudo privileges. Alternatively, use re-name the commands to use `sudo docker ...` and `sudo docker-compose ...` instead of `docker...` and `docker-compose ...`

###Features:

* Uses php:5.6 and mysql:5.7 Docker images
* Ready for Gitlab-CI integration. Use the .sh files to see how tests are run using docker-compose.
* Ready for unit tests with PHPUnit. Default phpunit.xml settings file needs to be in the site directory

###Coming later: 

* Composer integration - still need to figure out how to add that easily
* Travis integration