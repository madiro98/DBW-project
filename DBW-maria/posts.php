<?php

include("globals.php");
include("$baseDir/include/db.php");

function validatePost($post){

		$errors = array();

		//if (empty($post['Title'])) {
		//	array_push($errors, 'Title is required');
		//}

		if (empty($post['Description'])) {
			array_push($errors, "Content is required.");
		}

		if(!empty($post['Title'])){

		$existingPost = selectOne('Posts', ['Title' => $post['Title']]);
		if ($existingPost) {
			array_push($errors, 'Post title already exists.');
		}
	}
		//dd($allerrors);
		return $errors;
}

$table = 'Posts';
$errors = array();
$title = "";
$description = "";

if (isset($_POST['add-post'])){
	$errors = validatePost($_POST);

	if (!empty($_FILES['image']['name'])) {

		$image_name = time() . '_' . $_FILES['image']['name']; //so that the name of the image is unique we add the time
		$destination = "$baseDir/images/" . $image_name;

		$result = move_uploaded_file($_FILES['image']['tmp_name'], $destination);

		if ($result) {
			$_POST['image'] = $image_name;

		} else {
			array_push($errors, 'Failed to upload image.');
		}

	}

	if (count($errors) == 0) {

		unset($_POST['add-post']);
		$_POST['UserID'] = $_SESSION['idUser'];
		$_POST['Likes'] = 0;
		$_POST['Comments'] = 0;

		if(!isset($_POST['parent'])){

			$_POST['parent'] = 0;
		}
		$post_id = create($table, $_POST);

		if ($_POST['parent'] != 0){
			$data = $_POST['parent'];
			$num_comments = update_comment($table, ['idPosts' => $data]);
		}

		header('Location: ' . $_SERVER['HTTP_REFERER']);
		exit();
	} else {

		if (!empty($_POST['Title'])){
			$title = $_POST['Title'];
		}
		$description = $_POST['Description'];
	}
}