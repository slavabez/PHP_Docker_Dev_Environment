## PHP Docker environment tailored for PHP

Use this project to quickly get started with a new PHP site using Docker containers. For SilverStripe development, use the "silverstripe" branch.

### Requirements

* Docker
* Docker-compose
* docker user needs to have sudo privileges. Alternatively, use re-name the commands to use `sudo docker ...` and `sudo docker-compose ...` instead of `docker...` and `docker-compose ...`

### Features:

* Uses php:5.6 and mysql:5.7 Docker images
* Ready for Gitlab-CI integration. Use the .sh files to see how tests are run using docker-compose.
* Ready for unit tests with PHPUnit. Default phpunit.xml settings file needs to be in the site directory

### How to start:

1. Satisfy the requirements. Execute `docker --version` and make sure it's at least version 1.12. Execute `docker-compose --version` and make sure it's at least version 1.10.0 (for docker-compose version 2 compatibility)

2. If needed, modify the files in /apache_files/ to customise SSL Keys, SS Environment or the php.ini file

3. Execute the `build_and_deploy.sh` script, or the `build_and_deploy_ssl.sh` script if you need HTTPS

4. Ports are specified in the docker-compose.yml files, feel free to change them from the default 80:80 (or 443:443)

5. If everything went well, you should see the log output from the docker containers

6. Navigate to http://localhost/test.php or https://localhost/test.php

7. Your PHP files go into the `/www/` directory. You should find the test.php file there already

8. MySQL username and password are both `root` by default. To change the root password or default database/schema name - alter the `docker-compose.yml` file(s) under the `environment` section

9. The MySQL database can be accessed on localhost:3306 using an external app such as MySQL Workbench. The database files are stored locally in `/sqldata/`. To disable that uncomment the `volumes:  - ./sqldata:/var/lib/mysql` line from the `docker-compose.yml` file(s)

### Bash scripts:

* build_and_deploy.sh - Runs a docker-compose command to rebuild and start the docker containers as listed in the docker-compose.yml 

* build_and_deploy_ssl.sh - Same as above but uses the HTTPS Dockerfile. You can paste your own keys instead in the apache_files folder

* run_test.sh - First builds, then executes the 

### Coming later: 

* Composer integration - still need to figure out how to add that properly. For now you can use composer on your machine to sync the files, add the --ignore-platform-reqs if needed (E.g. if you want to install SilverStripe 3.4 but you have PHP 7.1 on your machine Composer will refuse to install it as SS 3.4 needs PHP 5.6. Adding the flag will force install it)

* Travis integration