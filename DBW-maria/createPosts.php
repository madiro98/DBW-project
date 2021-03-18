<?php include("globals.php"); ?>
<?php include("posts.php"); ?>
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
          <p>Interests</p>
          <p>
            <span class="w3-tag w3-small w3-theme-d5">Biology</span>
            <span class="w3-tag w3-small w3-theme-d4">Maths</span>
            <span class="w3-tag w3-small w3-theme-d3">Bioinformatics</span>
            <span class="w3-tag w3-small w3-theme-d2">Bash</span>
            <span class="w3-tag w3-small w3-theme-d1">Python</span>
            <span class="w3-tag w3-small w3-theme">R</span>
            <span class="w3-tag w3-small w3-theme-l1">Chemistry</span>
            <span class="w3-tag w3-small w3-theme-l2">Developing</span>
            <span class="w3-tag w3-small w3-theme-l3">Genomics</span>
            <span class="w3-tag w3-small w3-theme-l4">Structural Protein</span>
            <span class="w3-tag w3-small w3-theme-l5">Sequencing Techniques</span>
          </p>
        </div>
      </div>
      <br>
      
      <!-- Alert Box -->
      <div class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">
        <span onclick="this.parentElement.style.display='none'" class="w3-button w3-theme-l3 w3-display-topright">
          <i class="fa fa-remove"></i>
        </span>
        <p><strong>Hey!</strong></p>
        <p>People are looking at your profile. Find out who.</p>
      </div>
    
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7">
    
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <form action="createPosts.php" method="post" enctype="multipart/form-data">
              <div class="w3-container w3-padding">
                <h2 class="w3">Create a post</h2>
                <?php include("$baseDir/include/formErrors.php"); ?>
                <div>
                  <label>Title:</label>
                  <input type="text" name="Title" contenteditable="true" class="w3-border w3-padding" style="color:grey; width:100%; margin-bottom: 15px;" value = "<?php echo $title ?>">
                </div>
                <div>
                  <label>Content:</label>
                  <textarea name="Description" id="Description" contenteditable="true" class="w3-border w3-padding" style="color:grey; width:735px; margin-bottom: 15px;" ><?php echo $description ?></textarea>
                </div>
                <div>
                  <label>Image:</label>
                  <input type="file" name="image" class="text-input" style="margin-bottom: 20px;">
                  <input type="hidden" name="Section" value="UserPost">
                </div>
                <button type="submit" name="add-post" class="w3-button w3-theme"><i class="fa fa-pencil"></i> &nbsp;Post</button>
              </div>
           </form>
          </div>
        </div>
      </div>
      
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
    <div class="w3-col m2">
        <div class="w3-card w3-round w3-white w3-center">
        <div class="w3-container">
          <h4><strong>Back to main page</strong></h4>
          <p><button onclick="location.href='index.php'" class="w3-button w3-block w3-theme-l4"><i class="fa fa-home"></i> &nbsp;Go back</button></p>
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
 
<script>
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
