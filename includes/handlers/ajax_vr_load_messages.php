<?php
include("../../config/config.php");
include("../classes/User.php");
include("../classes/Message.php");

$limit = 5; //number of messages to load
$message = new Message($con, $_REQUEST['userLoggedIn']);
echo $message->getConvosVR($_REQUEST, $limit);
?>