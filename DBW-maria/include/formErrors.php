<?php

if(count($errors) > 0): ?>
	<div class= "msg error">
	<?php foreach ($errors as $error): ?>
		<li style = "color:red;"><?php echo $error; ?></li>
	<?php endforeach; ?>
	</div>
<?php endif; ?>