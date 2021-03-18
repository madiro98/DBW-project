<?php

include("globals.php");
include("$baseDir/include/db.php");


if(isset($_SERVER['HTTP_REFERER'])){

	$return_to = $_SERVER['HTTP_REFERER'];
} else {
	$return_to = "social.php";
}

	if(isset($_GET['type']) && isset($_GET['id'])){
		
		if(is_numeric($_GET['id'])){

			$allowed[] = 'post';
			$allowed[] = 'comment';
			
			if(in_array($_GET['type'], $allowed)){
				$post = like_post($_GET['id'], $_GET['type'], $_SESSION['idUser']);
			}
		}

	}

header("Location: " . $return_to);
die;
