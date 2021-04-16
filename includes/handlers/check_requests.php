<?php
include '../../config/config.php';
 
$userLoggedIn = $_POST['user'];
		
		$query = mysqli_query($con, "SELECT * FROM friend_requests WHERE user_to='$userLoggedIn'");
 
		$num =  mysqli_num_rows($query);
 
		if($num > 0)
		   echo $num;