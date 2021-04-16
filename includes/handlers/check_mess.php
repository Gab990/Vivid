<?php
include '../../config/config.php';
 
$userLoggedIn = $_POST['user'];
		
 
		$query = mysqli_query($con, "SELECT * FROM messages WHERE viewed='no' AND user_to='$userLoggedIn'");
 
		$list = array();
 
		while($row = mysqli_fetch_array($query)) {
 
			array_push($list, $row['user_from']);
		}
 
		$num = count(array_unique($list));
 
		if($num > 0)
		   echo $num;