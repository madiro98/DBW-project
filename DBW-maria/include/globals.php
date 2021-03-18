<?php
/*
 * globals.inc.php
 * Global variables and settings
 */
// Base directories
// Automatic, taken from CGI variables.
$baseDir = dirname($_SERVER['SCRIPT_FILENAME']);
#$baseDir = '/home/dbw00/public_html/PDBBrowser';
$baseURL = dirname($_SERVER['SCRIPT_NAME']);

// Temporal dir, create if not exists, however Web server 
// may not have the appropriate permission to do so
//$tmpDir = "$baseDir/tmp";
//$tmpDir="/home/maria/BLAST";
//if (!file_exists($tmpDir)) {
//    mkdir($tmpDir);
//}

// Include directory
$incDir = "$baseDir/app/include";

// Load accessory routines
require_once "$incDir/bdconn.php";
include_once "$incDir/libDBW.php";

// Start session to store queries
session_start();