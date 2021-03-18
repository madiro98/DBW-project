<?php

/*
 * bdconn.inc.php
 * DB Connection
 */
$host = "localhost";
$dbname = "website";
$user = "root";
$password = "";
($mysqli = mysqli_connect($host, $user, $password)) or die(mysqli_error());
mysqli_select_db($mysqli, $dbname) or die(mysqli_error($mysqli));
