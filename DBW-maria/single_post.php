<?php require "globals.php";
include("posts.php");

//include("$baseDir/include/db.php");

$post = false;

if(!empty($_GET['id'])){

	$id = $_GET['id'];
	$posts = getPosts('idPosts', ['idPosts' => $id], 'Date');
	$post = $posts[0];

} else {

	$ERROR = "No post was found!";
	print($ERROR);
}

//posting
//if ($_SERVER['REQUEST_METHOD'] == "POST"){

//	$post = create('Posts', )
//}

?>


<!DOCTYPE html>
<html>
<title>Single Post</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4, h5 {font-family: "Open Sans", sans-serif}
</style>

<body class="w3-theme-l5">


<?php include("$baseDir/include/header.php"); ?>

<?php
if (is_array($post)): ?>

	<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
  <!-- The Grid -->
  <div class="w3-row">
  	 <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white">
        <div class="w3-container">
         <h4 class="w3-center">My Profile</h4>
         <p class="w3-center"><img src="images/avatar3.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
         <hr>
         <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> Bioinformatician, UPF</p>
         <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> Barcelona</p>
         <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> April 1, 1988</p>
        </div>
      </div>
      <br>
      
      <!-- Accordion -->
      <div class="w3-card w3-round">
        <div class="w3-white">
          <button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> My Groups</button>
          <div id="Demo1" class="w3-hide w3-container">
            <p>Some text..</p>
          </div>
          <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> My Events</button>
          <div id="Demo2" class="w3-hide w3-container">
            <p>Coming soon...</p>
          </div>
          <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> My Photos</button>
          <div id="Demo3" class="w3-hide w3-container">
         <div class="w3-row-padding">
         <br>
           <div class="w3-half">
             <img src="images/lab1.png" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="images/lab2.png" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="images/lab3.png" style="width:100%" class="w3-margin-bottom">
           </div>
           <div class="w3-half">
             <img src="images/lab4.png" style="width:100%" class="w3-margin-bottom">
           </div>
         </div>
          </div>
        </div>      
      </div>
      <br>
      
      <!-- Interests --> 
      <div class="w3-card w3-round w3-white w3-hide-small">
        <div class="w3-container">
          <h5>Search Posts</h5>
          <form action="index.php" method="post">
            <input type="text" name="search-term" class="text-input" placeholder="Search..." style="margin-bottom: 20px; width:100%;">
          </form>
        </div>
      </div>
      <br>
    
    <!-- End Left Column -->
    </div>	

	<div class="w3-col m7">
     
     <!-- Posts -->
     <div class="w3-card w3-round w3-theme-d1 w3-margin">
        <div class="w3-container">
          <h1><?php echo "Comments" ?></h1>
        </div>
      </div>
      <br>

	 <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <span class="w3-right w3-opacity"><?php echo date('F j, Y', strtotime($post['Date'])); ?></span>
        <h3 class="w3-round"><?php echo $post['Title']; ?></h3>
        <h6 class="w3-opacity"><?php echo $post['Username'] ?></h6><br>
        <p><?php echo $post['Description']; ?></p>
        <?php if (!empty($post['image'])): ?>
          <img src="<?php echo $baseURL . '/images/' . $post['image']; ?>" style="width:100%" alt="image" class="w3-margin-bottom">
        <?php endif; ?>
        <a type="button" href="like.php?type=post&id=<?php echo $post['idPosts'] ?>" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up" <?php $result = color_like($post['idPosts'], $_SESSION['idUser']);
        if ($result): ?>

        style="color:#03fc24;"

        <?php endif; ?>
        ></i> &nbsp;<?php echo $post['Likes']; ?> Likes</a>
        <a type="button" class="w3-button w3-theme-d2 w3-margin-bottom" href="single_post.php?id=<?php echo $post['idPosts'] ?>"><i class="fa fa-comment"></i> &nbsp;<?php echo $post['Comments'] ?> Comments</a>

        <h5>Leave a comment:</h5>
          <form method="post">
             <textarea type="text" name="Description" contenteditable="true" class="w3-border w3-padding" style="color:grey; width:100%; margin-bottom: 15px;"></textarea>
             <input type="hidden" name="parent" value="<?php echo $post['idPosts'] ?>">
             <button type="submit" name="add-post" class="w3-button w3-theme" style="margin-bottom: 15px;"><i class="fa fa-pencil"></i> &nbsp;Post</button>
          </form>

      </div>

      <?php

      $comments = getPosts('parent',['parent' => $id], 'Likes');

      if(is_array($comments)):

      	foreach ($comments as $comment): ?>

		 <div class="w3-container w3-card w3-white w3-round w3-margin" style="width:85%; float:right;"><br>
	        <span class="w3-right w3-opacity"><?php echo date('F j, Y', strtotime($comment['Date'])); ?></span>
	        <h6 class="w3-opacity"><?php echo $comment['Username'] ?></h6><br>
	        <p><?php echo $comment['Description']; ?></p>
	        <a type="button" href="like.php?type=post&id=<?php echo $comment['idPosts'] ?>" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up" <?php $result = color_like($comment['idPosts'], $_SESSION['idUser']);
	        if ($result): ?>

	        style="color:#03fc24;"

	        <?php endif; ?>
	        ></i> &nbsp;<?php echo $comment['Likes']; ?> Likes</a>
	        <a type="button" class="w3-button w3-theme-d2 w3-margin-bottom" href="single_post.php?id=<?php echo $comment['idPosts'] ?>"><i class="fa fa-comment"></i> &nbsp;Comments</a>
	      </div>

      <?php endforeach;
      endif; ?>
      <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->


<div class="w3-col m2">
	      <div class="w3-card w3-round w3-white w3-center">
        <div class="w3-container">
          <h4><strong>Back to main page</strong></h4>
          <p><button onclick="<?php if ($post['Section'] == 'UserPost'){
          	echo "location.href='index.php'";
          } else {
          	echo "location.href='forum.php'";
          }
          ?>" class="w3-button w3-block w3-theme-l4"><i class="fa fa-home"></i> &nbsp;Go back</button></p>
        </div>
      </div>
      <br>

      <div class="w3-card w3-round w3-white w3-center">
        <div class="w3-container">
          <h4><strong>Create a new post:</strong></h4>
          <img src="images/write5.jpeg" alt="Forest" style="width:100%;">
          <p><button onclick="location.href='createPosts.php'" class="w3-button w3-block w3-theme-l4"><i class="fa fa-pencil"></i> &nbsp;Write post</button></p>
        </div>
      </div>
      <br>
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>

<?php endif;?>

<?php include("$baseDir/include/footer.php");?>

</body>
</html>