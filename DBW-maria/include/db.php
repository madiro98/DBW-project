<?php

require("bdconn.php");


function dd($value){ //to be deleted

	echo "<pre>", print_r($value, true), "<pre>";
	die();
}


function executeQuery($sql, $data){

	global $mysqli;
	$stmt = $mysqli->prepare($sql);
	$values = array_values($data);
	$types = str_repeat('s', count($values));
	$stmt->bind_param($types, ...$values);
	$stmt->execute();
	return $stmt;
}


function selectAll($table, $conditions = []){

	global $mysqli;
	$sql = "SELECT * FROM $table";
	if(empty($conditions)){

		$stmt = $mysqli->prepare($sql);
		$stmt->execute();
		$records = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
		return $records;
	} else {

		$i = 0;
		foreach ($conditions as $key => $value) {

			if ($i == 0){
				$sql = $sql . " WHERE $key=?";
			} else {
				$sql = $sql . " AND $key=?";
			}
			$i++;
		}

		$stmt = executeQuery($sql, $conditions);
		$records = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
		return $records;
	}
	
}

function selectOne($table, $conditions){

	global $mysqli;
	$sql = "SELECT * FROM $table";


	$i = 0;
	foreach ($conditions as $key => $value) {

		if ($i == 0){
			$sql = $sql . " WHERE $key=?";
		} else {
			$sql = $sql . " AND $key=?";
		}
		$i++;
	}

	$sql = $sql . " LIMIT 1";

	$stmt = executeQuery($sql, $conditions);
	$records = $stmt->get_result()->fetch_assoc();
	return $records;
	
}

function create($table, $data){

	global $mysqli;
	$sql = "INSERT INTO $table SET ";

	$i = 0;
	foreach ($data as $key => $value) {

		if ($i == 0){
			$sql = $sql . " $key=?";
		} else {
			$sql = $sql . ", $key=?";
		}
		$i++;
		
	}
	$stmt = executeQuery($sql, $data);
	$id = $stmt->insert_id;
	return $id;
}


function update_comment($table, $data){

	global $mysqli;
	$sql = "UPDATE $table SET Comments = Comments + 1 WHERE idPosts=? LIMIT 1";
	$stmt = executeQuery($sql, $data);
	
	return $stmt->affected_rows;
}


function getPosts($column, $conditions, $order, $extra = NULL){

	global $mysqli;
	$sql = "SELECT p.*, u.Username FROM Posts AS p JOIN Users AS u ON p.UserID=u.idUser WHERE p.$column=?" . $extra . " ORDER BY p.$order DESC";

	$stmt = executeQuery($sql, $conditions);
	$records = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
	return $records;
}


function searchPosts($section, $term){

	global $mysqli;
	$sql = "SELECT p.*, u.Username FROM Posts AS p JOIN Users AS u ON p.UserID=u.idUser WHERE p.Section=? AND p.Title LIKE '%$term%' OR p.Description LIKE '%$term%' ORDER BY p.Date DESC";

	$stmt = executeQuery($sql, $section);
	$records = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
	return $records;
}

function getComments($id){

	global $mysqli;
	$sql = "SELECT c.*, u.Username FROM Comments AS c JOIN Users AS u ON c.UserID=u.idUser WHERE c.PostID=? ORDER BY c.Date DESC";

	$stmt = executeQuery($sql, $id);
	$records = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
	return $records;
}


function like_post($id, $type, $idUser){

	global $mysqli;

	if($type == "post"){
		
		//save like details
		$sql = "SELECT likes FROM likes WHERE type='post' && contentid='$id' LIMIT 1";
		$stmt = $mysqli->prepare($sql);
		$stmt->execute();
		$records = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
		if(!empty($records)){

			$likes = json_decode($records[0]['likes'],true);

			$user_ids = array_column($likes, "userid");

			if(!in_array($idUser, $user_ids)){

				$arr["userid"] = $idUser;
				$arr["date"] = date("Y-m-d H:i:s");

				$likes[] = $arr;

				$likes_string = json_encode($likes);
				$sql = "UPDATE likes SET likes = '$likes_string' WHERE type='post' && contentid='$id' LIMIT 1";
				$stmt = $mysqli->prepare($sql);
				$stmt->execute();

				//Increment Posts table
				$sql = "UPDATE Posts SET Likes = Likes + 1 WHERE idPosts ='$id' LIMIT 1";
				$stmt = $mysqli->prepare($sql);
				$stmt->execute();

			} else {

				$key = array_search($idUser, $user_ids);
				unset($likes[$key]);

				$likes_string = json_encode($likes);
				$sql = "UPDATE likes SET likes = '$likes_string' WHERE type='post' && contentid='$id' LIMIT 1";
				$stmt = $mysqli->prepare($sql);
				$stmt->execute();

				//Increment Posts table
				$sql = "UPDATE Posts SET Likes = Likes - 1 WHERE idPosts ='$id' LIMIT 1";
				$stmt = $mysqli->prepare($sql);
				$stmt->execute();
			}

		} else {
			
			$arr[0]["userid"] = $idUser;
			$arr[0]["date"] = date("Y-m-d H:i:s");


			$likes = json_encode($arr);
			$sql = "INSERT INTO likes (type,contentid,likes) VALUES ('$type', '$id', '$likes')";
			$stmt = $mysqli->prepare($sql);
			$stmt->execute();

			//Increment Posts table
			$sql = "UPDATE Posts SET Likes = Likes + 1 WHERE idPosts ='$id' LIMIT 1";
			$stmt = $mysqli->prepare($sql);
			$stmt->execute();
		}
	}
	

}

function color_like($idPosts, $idUser){

	//dd($idPosts);
	global $mysqli;

	$sql = "SELECT likes FROM likes WHERE contentid='$idPosts' LIMIT 1";
	$stmt = $mysqli->prepare($sql);
	$stmt->execute();
	$records = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);

	if (empty($records)){
		return false;
	}
	
	//$sql = "SELECT likes FROM likes WHERE contentid=$idPosts LIMIT 1";
	//$stmt = $mysqli->prepare($sql);
	//$stmt->execute();
	//$records = $stmt->get_result()->fetch_all(MYSQLI_ASSOC);
	//dd($records);

	$likes = json_decode($records[0]['likes'],true);

	$user_ids = array_column($likes, "userid");

	if (in_array($idUser, $user_ids)){
		return true;
	} else {
		return false;
	}

}


//$conditions = [

//	'Username' => 'maria2',
//	'Password' => 'maria2',
//	'email' => 'maria2@prova.com'

//];

//$users = create('Users', $conditions);
//dd($users);
