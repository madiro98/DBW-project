<?php require "globals.php";

include("$baseDir/include/db.php");

$posts = array();
$postsTitle = 'Recent Posts';
//dd($posts);

if (isset($_POST['search-term'])){
  $postsTitle = "You searched for: '" . $_POST['search-term'] . "'";
  $posts = searchPosts(['Section' => 'UserPost'], $_POST['search-term']);
} else {

  $posts = getPosts('Section',['Section' => 'UserPost', 'parent' => 0], 'Date', ' AND p.parent=?');
}


?>
<!DOCTYPE html>
<html>
<title>DBW project</title>
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
<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
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
    
    <!-- Middle Column -->
    <div class="w3-col m7">
     
     <!-- Posts -->
     <div class="w3-card w3-round w3-theme-d1 w3-margin">
        <div class="w3-container">
          <h1><?php echo $postsTitle ?></h1>
        </div>
      </div>
      <br>
     
     <?php foreach ($posts as $post): ?>

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
      </div>


     <?php endforeach; ?>
      
      
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
    <div class="w3-col m2">
      <div class="w3-card w3-round w3-white w3-center">
        <div class="w3-container">
          <h4><strong>Create a new post:</strong></h4>
          <img src="images/write5.jpeg" alt="Forest" style="width:100%;">
          <p><button onclick="location.href='createPosts.php'" class="w3-button w3-block w3-theme-l4"><i class="fa fa-pencil"></i> &nbsp;Write post</button></p>
        </div>
      </div>
      <br>
      
      <div class="w3-card w3-round w3-white w3-center">
        <div class="w3-container">
          <p>Friend Request</p>
          <img src="images/avatar6.png" alt="Avatar" style="width:50%"><br>
          <span>Micheal Brick</span>
          <div class="w3-row w3-opacity">
            <div class="w3-half">
              <button class="w3-button w3-block w3-green w3-section" title="Accept"><i class="fa fa-check"></i></button>
            </div>
            <div class="w3-half">
              <button class="w3-button w3-block w3-red w3-section" title="Decline"><i class="fa fa-remove"></i></button>
            </div>
          </div>
        </div>
      </div>
      <br>
      
      <div class="w3-card w3-round w3-white w3-padding-16 w3-center">
        <p>ADS</p>
      </div>
      <br>
      
      <div class="w3-card w3-round w3-white w3-padding-32 w3-center">
        <p><i class="fa fa-bug w3-xxlarge"></i></p>
      </div>
      
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>

<!-- Footer -->
<?php include("$baseDir/include/footer.php");?>


<script type="text/javascript">
// Accordion
function myFunction(id) {
  var x = document.getElementById(id);
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
    x.previousElementSibling.className += " w3-theme-d1";
  } else { 
    x.className = x.className.replace("w3-show", "");
    x.previousElementSibling.className = 
    x.previousElementSibling.className.replace(" w3-theme-d1", "");
  }
}

// Used to toggle the menu on smaller screens when clicking on the menu button
function openNav() {
  var x = document.getElementById("navDemo");
  if (x.className.indexOf("w3-show") == -1) {
    x.className += " w3-show";
  } else { 
    x.className = x.className.replace(" w3-show", "");
  }
}

</script>

</body>
</html> 
