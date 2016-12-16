<?php
/**
 * Created by IntelliJ IDEA.
 * User: slava
 * Date: 16/12/16
 * Time: 19:42
 */

?>
<h1>PHP works!</h1>

<p>This is the test page for a fresh dev environment installation.</p>

<h2>Database test using host: db, user root and password root:</h2>

<?php

mysqli_connect("db", "root", "root") or die(mysqli_error());
echo "Connected to MySQL<br />";

?>

<h2>PHP info</h2>

<?php phpinfo();

