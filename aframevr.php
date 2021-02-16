<?php
require 'config/config.php';
include("includes/classes/User.php");
include("includes/classes/Post.php");

if (isset($_SESSION['username'])) {
    $userLoggedIn = $_SESSION['username'];
    $user_details_query = mysqli_query($con, "SELECT * FROM users WHERE username='$userLoggedIn'");
    $user = mysqli_fetch_array($user_details_query);
} else {
    header("Location: register.php");
}
$username = $_GET['profile_username'];
$user_room_query =  mysqli_query($con,"SELECT * FROM users WHERE username='$username'");
$user_room_values = mysqli_fetch_array($user_room_query);

?>

<html>

<head>
    <script src="https://aframe.io/releases/1.2.0/aframe.min.js"></script>
</head>

<body>
    <a-scene>
        <?php

        if ($username != $userLoggedIn) { ?>
            <a-box position="-1 5 -3" rotation="0 45 0" color="#4CC3D9"></a-box>
        <?php } ?>
        <a-entity text="value: <?php echo $user_room_values['first_name'] . " " . $user_room_values['last_name'] . "'s Room"; ?>; color: #000" position="1 3 -3" scale="4 4 4"></a-entity>
        <?php
        $result = mysqli_query($con, "SELECT * FROM users");

        if (mysqli_num_rows($result) > 0) {
            // output data of each row
            while ($row = mysqli_fetch_assoc($result)) {
                $i = 0; ?>
                <a-entity id="aframe_entries_<?php echo $row['id']; ?>" text="value:
                                    <?php
                                    echo "id: " . $row["id"] . " - Name: " . $row["username"] . "<br>";
                                    ?>; color: #000" <?php if ($row['id'] == 1) {
                                                            echo 'position="-0.9 1.2 -3"';
                                                        } else {
                                                            echo 'position="-0.9 2 -3"';
                                                        } ?> scale="1.5 1.5 1.5"></a-entity>
        <?php
            }
        }   ?>

        <a-box position="-1 0.5 -3" rotation="0 45 0" color="#4CC3D9"></a-box>
        <a-sphere position="0 1.25 -5" radius="1.25" color="#EF2D5E"></a-sphere>
        <a-cylinder position="1 0.75 -3" radius="0.5" height="1.5" color="#FFC65D"></a-cylinder>
        <a-plane position="0 0 -4" rotation="-90 0 0" width="4" height="4" color="#7BC8A4"></a-plane>
        <a-sky color="#ECECEC"></a-sky>
    </a-scene>
</body>

</html>