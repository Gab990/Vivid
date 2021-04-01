<?php
require 'config/config.php';
include("includes/classes/User.php");
include("includes/classes/Post.php");
include("includes/classes/Message.php");
include("includes/classes/Notification.php");

if (isset($_SESSION['username'])) {
    $userLoggedIn = $_SESSION['username'];
    $user_details_query = mysqli_query($con, "SELECT * FROM users WHERE username='$userLoggedIn'");
    $user = mysqli_fetch_array($user_details_query);
} else {
    header("Location: register.php");
}
$username = $_GET['profile_username'];
$user_room_query =  mysqli_query($con, "SELECT * FROM users WHERE username='$username'");
$user_room_values = mysqli_fetch_array($user_room_query);
$post_obj = new Post($con, $userLoggedIn);
$logged_in_user_obj = new User($con, $userLoggedIn);
$message_obj = new Message($con, $userLoggedIn);

$user_vrroom_query = mysqli_query($con, "SELECT * FROM vr_room WHERE username='$username' AND user_closed='no'");
$user_vrroom_values = mysqli_fetch_array($user_vrroom_query);
?>

<html>

<head>
    <link rel="stylesheet" href="assets/css/styleVR.css">



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://aframe.io/releases/1.2.0/aframe.min.js"></script>

    <!-- ALL IMPORTED COMPONENTS USE THE MIT LICENCE UNLESS OTHERWISE STATED -->

    <!-- Need to include the script for event-set components - created by Kevin Ngo-->
    <script src="https://unpkg.com/aframe-event-set-component@5.0.0/dist/aframe-event-set-component.min.js"></script>

    <!--Look-At component script - created by Kevin Ngo-->
    <script src="https://unpkg.com/aframe-look-at-component@0.8.0/dist/aframe-look-at-component.min.js"></script>

    <!-- Super hands for controller-based interactions - created by Will Murphy-->
    <script src="https://unpkg.com/super-hands@^3.0.1/dist/super-hands.min.js"></script>

    <!-- Super hands file, modify this to personalise cursor behaviour and color - created by Will Murphy-->
    <script src="assets/js/progressive-controls.js"></script>

    <!-- A-Frame-extras script for auto-recognised movement controls - created by Don McCrudy-->
    <script src="//cdn.rawgit.com/donmccurdy/aframe-extras/v4.1.2/dist/aframe-extras.min.js"></script>

    <!-- A-Frame navigation mesh plugin - adds collision options and restricts movement - created by Don McCrudy-->
    <!-- Will be fully implemented when the developers update it to A-Frame 1.2.0 -->
    <script src="https://recast-api.donmccurdy.com/aframe-inspector-plugin-recast.js"></script>

    <!-- A-Frame Blink Controls for moving around the scene in VR - created by Jure -->
    <script src="https://cdn.jsdelivr.net/npm/aframe-blink-controls/dist/aframe-blink-controls.min.js"></script>

    <!-- A-Frame speech recognition component - created by Leonardo Malave-->
    <script src="//cdnjs.cloudflare.com/ajax/libs/annyang/2.5.0/annyang.min.js"></script>
    <script src="assets/js/aframe-speech-command-component.js"></script>

    <!--HTML embed component makes using HTML tags usable in A-Frame environment - created by Paul Brunt-->
    <script src="assets/js/htmlembed.js"></script>


    <script>
        //appending all messages to the scene at start   
        function loadAll() {
            var userLoggedIn = '<?php echo $userLoggedIn; ?>';
            $.ajax({
                url: "includes/handlers/ajax_vr_load_messages.php",
                type: "POST",
                data: "&userLoggedIn=" + userLoggedIn,
                cache: false,

                success: function(response) {
                    $('#message-plane').append(response);
                },
            });
        }
        loadAll();
    </script>
</head>

<body>
    <div id="slide2" class="slide">
        <div id="slide3" class="slide">
            <div id="slide4" class="slide">
                <a-scene renderer="antialias: true" id="main-scene">

                    <!--Asset management system-->
                    <a-assets>
                        <a-assets-item id="room" src="<?php echo $user_vrroom_values['room_model']; ?>"></a-assets-item>
                        <a-assets-item id="bigboy" src="assets/models/bigboy/Big boy machine.gltf"></a-assets-item>
                        <a-assets-item id="record" src="assets/models/Record/Substance record.glb"></a-assets-item>
                        <a-assets-item id="boombox" src="assets/models/Boombox/Boombox.glb"></a-assets-item>
                        <a-assets-item id="corner" src="<?php echo $user_vrroom_values['corner_model']; ?>"></a-assets-item>
                        <a-assets-item id="corner2" src="<?php echo $user_vrroom_values['corner2_model']; ?>"></a-assets-item>
                        <img id="floor" src="assets/images/vr/floor.png">
                        <img id="skybox" src="<?php echo $user_vrroom_values['skybox']; ?>">
                    </a-assets>

                    <!--Speech recognition entity-->
                    <a-entity id="annyang" annyang-speech-recognition></a-entity>

                    <!-- CAMERA RIG -->
                    <a-entity id="camRig" position="0 0 -1.5">
                        <!-- CAMERA -->
                        <a-entity camera="active: true" position="0 1.6 0" wasd-controls id="cam" look-controls="pointerLockEnabled: true">
                            <a-cursor position="0 0 -0.5" scale="0.5 0.5 0.5"></a-cursor>
                        </a-entity>
                        <!-- HAND UI MENU -->
                        <a-entity hand-controls="hand:left">
                            <a-entity id="handmenu" 
                            class="screen menu3" 
                            htmlembed="ppu:256" 
                            scale="0.15 0.15 0.15" 
                            position="0 0.2 -0.1" 
                            rotation="-15 0 0" 
                            visible="false"
                            speech-command__show="command: show menu; 
                                        type: attribute; 
                                        attribute: visible; 
                                        value: true;" 
                            speech-command__hide="command: hide menu; 
                                        type: attribute; 
                                        attribute: visible; 
                                        value: false;">
                                <h2 style="margin-top:0">Menu</h2>
                                <ul>
                                    <li><a href="#" class="button">Home</a></li>
                                    <li><a href="#slide2" class="button">Messages</a></li>
                                    <li><a href="#slide3" class="button">Profile</a></li>
                                    <li><a href="#slide4" class="button">Friends</a></li>
                                </ul>
                            </a-entity>
                        </a-entity>

                        <a-entity hand-controls="hand:right" blink-controls="cameraRig: #camRig; button: thumbstick"></a-entity>
                    </a-entity>


                    <!-- Room - basic-->
                    <a-entity position="-2 0.1 -4" scale="1.5 1.5 1.5" rotation="0 -90 0" gltf-model="#room">
                        <!-- Room - boombox-->
                        <a-entity scale="0.01 0.01 0.01" position="0 0 0" gltf-model="#boombox">
                        </a-entity>
                        <!-- Room - bigboy-->
                        <a-entity position="0 0 0" gltf-model="#bigboy">
                        </a-entity>
                        <!-- Room - record-->
                        <a-entity scale="0.01 0.01 0.01" position="0 0 0" gltf-model="#record">
                        </a-entity>
                        <!-- Personalisable corner object -->
                        <a-entity position="0 0 0" gltf-model="#corner">
                        </a-entity>
                        <!-- Personalisable corner #2 object -->
                        <a-entity position="0 0 0" gltf-model="#corner2">
                        </a-entity>
                    </a-entity>

                    <!-- HTML embedded SIDEMENU -->
                    <a-entity id="menu" class="screen menu dark" htmlembed="ppu:256" scale="0.46 0.46 0.46" position="-1.55 2.4 -8" rotation="7 0 0">
                        <h2 style="margin-top:0">MENU</h2>
                        <ul>
                            <li><a href="#" class="button">Home</a></li>
                            <li><a href="#slide2" class="button">Messages</a></li>
                            <li><a href="#slide3" class="button">Profile</a></li>
                            <li><a href="#slide4" class="button">Friends</a></li>
                        </ul>
                    </a-entity>

                    <!-- HTML embedded MAIN SCREEN -->
                    <a-entity id="menu" style="border:2px solid yellow" class="screen dark main" scale="0.46 0.46 0.46" htmlembed="ppu:256" position="-0.2 2.4 -8" rotation="7 0 0">
                        <h2 style="text-align:center; margin-top:0">MAIN SCREEN</h2>
                        <div id="page1">
                            <h1>Home</h1>
                            <p>Move around the room using the WASD keys or blink around using the right thumbstick</p>
                            <p>Navigate on this screen by looking at the menu on the right and use the trigger or mouse to pick an option</p>
                            <p>If you're using Chrome, enable microphone and control the hand menu by saying: "Show Menu" or "Hide Menu". Otherwise, you can use the spheres below the screen to make the menu appear</p>
                        </div>

                        <div id="page2">
                            <h1>Messages</h1>
                            <p>Latest messages: <span class="button2" id="refreshButton">REFRESH</span></p>
                            <?php
                            if ($username == $userLoggedIn) {
                                echo '<p id="message-plane"></p>';
                            } else {
                                echo '<p>You can not read these messages</p>';
                            } ?>
                        </div>


                        <div id="page3">
                            <h1>Profile</h1>
                            <?php
                            //get public details of the room owner, like posts, likes and friends
                            if (isset($_GET['profile_username'])) {
                                $username = $_GET['profile_username'];
                                $user_details_query = mysqli_query($con, "SELECT * FROM users WHERE username='$username'");
                                $num_users_like = mysqli_num_rows($user_details_query); //To check if the user exists
                                if ($num_users_like > 0) {
                                    $user_array = mysqli_fetch_array($user_details_query);
                                    $num_friends = (substr_count($user_array['friend_array'], ",")) - 1;
                                } else {
                                    header("Location: index.php");
                                }
                            }

                            //If the user's acc is closed, redirect
                            $profile_user_obj = new User($con, $username);
                            if ($profile_user_obj->isClosed()) {
                                header("Location: user_closed.php");
                            } ?>

                            <!-- General information about the room owner -->
                            <div class="profile_left">
                                <div class="profile_info">
                                    <p><?php echo "Name: " . $user_array['first_name'] . " " . $user_array['last_name']; ?></p>
                                    <p><?php echo "Posts: " . $user_array['num_posts']; ?></p>
                                    <p><?php echo "Likes: " . $user_array['num_likes']; ?></p>
                                    <p><?php echo "Friends: " . $num_friends; ?></p>
                                    <p><?php echo "Signup date: " . $user_array['signup_date']; ?></p>
                                </div>
                            </div>
                            <div class="profile_right">
                            <img style="border-radius:30px; border:5px solid yellow" width="450px" height="450px" src="<?php echo $user_array['profile_pic']; ?>">
                            </div>
                        </div>


                        <div id="page4">
                            <h1>Friends of <?php echo $user_room_values['first_name'] . " " . $user_room_values['last_name'] . ":"; ?></h1>
                            <p>Clicking on one will take you to their profile page</p>
                            <?php
                            $user2_obj = new User($con, $username);
                            foreach ($user2_obj->getFriendsList() as $friend2) {
                                $friend2_obj = new User($con, $friend2);
                                echo "<a href='$friend2' style='text-align:center;text-decoration:none;color:white;font-size:38px;'>
                                <img width='50px' height='50px' style='border:3px solid yellow;margin-right:35px;' src='" . $friend2_obj->getProfilePic() . "'><span id='profileLink' style='padding-left:15px;padding-right:15px; border-radius:10px'>"
                                    . $friend2_obj->getFirstAndLastName() .
                                    "</span></a><br>";
                            }
                            ?>
                        </div>
                    </a-entity>

                    <!-- Get one random image the user posted and put it in the frame||if no images, put profile pic in -->
                    <?php $post_obj->getRandomPostedImagesVR($username) ?>

                    <!-- Room owner's name -->
                    <a-entity style="border:2px solid yellow;" class="screen menu2" htmlembed="ppu:256" scale="0.46 0.46 0.46" position="-0.6 1.25 -8.3" rotation="7 0 0">
                        <h2 style="margin-top:0; font-size: 50px;text-transform:uppercase"><?php echo $user_room_values['first_name'] . " " . $user_room_values['last_name'] . "'s Room"; ?></h2>
                    </a-entity>

                    <!-- Show messages -->
                    <a-sphere material="color: #FFAA00;" radius="0.1" position="0 0.8 -8.1" 
                    event-set__showfriend="_target:#handmenu;
                                         _event:click;
                                         visible: true"
                    animation__enter="property: material.color;
                                 from: #FFAA00;
                                 to:#90EE90;
                                 startEvents: mouseenter;
                                 dur:750;
                                 easing:linear;"
                    animation__leave="property: material.color;
                                 from: #90EE90;
                                 to:#FFAA00;
                                 startEvents: mouseleave;
                                 dur:750;
                                 easing:linear;">
                    </a-sphere>

                    <!-- Hide messages -->
                    <a-sphere material="color: #DC143C;" radius="0.1" position="0.4 0.8 -8.1" 
                    event-set__hidefriend="_target:#handmenu;
                                         _event:click;
                                         visible: false"
                    animation__enter="property: material.color;
                                 from: #DC143C;
                                 to:#90EE90;
                                 startEvents: mouseenter;
                                 dur:750;
                                 easing:linear;"
                    animation__leave="property: material.color;
                                 from: #90EE90;
                                 to:#DC143C;
                                 startEvents: mouseleave;
                                 dur:750;
                                 easing:linear;">
                    </a-sphere>

                    <!-- FLOOR -->
                    <a-plane material="src:#floor; repeat: 700 700; transparent: true;" height="500" width="500" rotation="-90 0 0"></a-plane>

                    <!-- SKY -->
                    <a-sky src="#skybox" rotation="0 -90 0"></a-sky>
                </a-scene>

                <script>
                    //Manual refresh message function
                    $refresh = document.getElementById("refreshButton");
                    $refresh.addEventListener('click', function() {
                        $('#message-plane').empty();
                        loadAll();
                        console.log("Refresh button has been clicked");
                    });



                    //Automatically sync the messages every 5 second->near real-time messages
                    function messageUpdate() {
                        $(document).ready(function() {
                            setInterval(function() {
                                $('#message-plane').empty();
                                loadAll();
                                //console.log("Messages refreshed");
                            }, 5000);
                        });
                    }
                    messageUpdate();
                </script>
            </div>
        </div>
    </div>
</body>

</html>