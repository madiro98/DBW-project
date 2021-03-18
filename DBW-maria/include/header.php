<header>
<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa w3-margin-right"></i>Logo</a>
  <a href="index.php" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Main page"><i class="fa fa-home"></i></a>
  <a href="forum.php" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="Forum"><i class="fa fa-question"></i></a>
  <a href="news.php" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" title="News"><i class="fa fa-envelope"></i></a>
  <div class="w3-dropdown-hover w3-hide-small">
    <button class="w3-button w3-padding-large" title="Notifications"><i class="fa fa-bell"></i><span class="w3-badge w3-right w3-small w3-green">3</span></button>     
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      <a href="#" class="w3-bar-item w3-button">One new friend request</a>
      <a href="#" class="w3-bar-item w3-button">John Smith posted on your wall</a>
      <a href="#" class="w3-bar-item w3-button">Jane likes your post</a>
    </div>
  </div>
   <div class="w3-dropdown-hover w3-hide-small w3-right w3-padding-large w3-hover-white w3-button w3-padding-large" title="My Account">
	  	    <i class="fa fa-user">  <?php echo $_SESSION['Username']; ?></i>
	  <button class="w3-button w3-padding-large" title="My Account"></button>     
	   	  <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
	      <a href="#" class="w3-bar-item w3-button">Profile</a>
	      <a href="#" class="w3-bar-item w3-button" style="color: red;">Logout</a>
    </div>
</div>
  </a>
 </div>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">My Profile</a>
</div>

</header>