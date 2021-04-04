<?php
require 'config/config.php';
include("includes/classes/User.php");
include("includes/classes/Post.php");
include("includes/classes/Message.php");
include("includes/classes/Notification.php");

if(isset($_COOKIE['email']) && isset($_COOKIE['password'])) {
 
	$email = $_COOKIE['email'];
	$password = $_COOKIE['password'];
 
	$query = mysqli_query($con, "SELECT username FROM users WHERE email='$email' AND password='$password'");
 
	if(mysqli_num_rows($query) > 0) {
 
		$row = mysqli_fetch_array($query);
 
		$_SESSION['username'] = $row['username'];
 
	}
 
	else {
 
		header("Location: register.php");
	}
}

if (isset($_SESSION['username'])) {
    $userLoggedIn = $_SESSION['username'];
    $user_details_query = mysqli_query($con, "SELECT * FROM users WHERE username='$userLoggedIn'");
    $user = mysqli_fetch_array($user_details_query);
} else {
    header("Location: register.php");
}

?>

<!DOCTYPE html>
<html lang="en-GB">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="google" content="notranslate">
    <title>Welcome to Vivid</title>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="assets/js/bootstrap.js"></script>
    <script src="assets/js/main.js"></script>
    <script src="assets/js/bootbox.min.js"></script>
    <script src="assets/js/jcrop_bits.js"></script>
    <script src="assets/js/jquery.Jcrop.js"></script>
    <script src="https://aframe.io/releases/1.2.0/aframe.min.js"></script>


    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/jquery.Jcrop.css">
</head>

<body>

    <div class="top_bar">
        <div class="logo">
            <a style="margin:0;padding:0" href="index.php"><img width="45" height="45" style="padding-top:2px;padding-left:50px;" src="assets/images/icons/logo.png"></a>
        </div>


        <div class="search">
            <form action="search.php" method="GET" name="search_form">
                <input type="text" onkeyup="getLiveSearchUsers(this.value, '<?php echo $userLoggedIn; ?>')" name="q" placeholder="Search..." autocomplete="off" id="search_text_input">

                <div class="button_holder">
                <img width="30" height="30" src="assets/images/icons/magnify.png" alt="">
                </div>
            </form>

            <div class="search_results">
            </div>

            <div class="search_results_footer_empty">
            </div>
        </div>


        <nav>

            <?php
            //unread messages 
            $messages = new Message($con, $userLoggedIn);
            $num_messages = $messages->getUnreadNumber();

            //unread notificaitons 
            $notifications = new Notification($con, $userLoggedIn);
            $num_notifications = $notifications->getUnreadNumber();

            //unread notificaitons 
            $user_obj = new User($con, $userLoggedIn);
            $num_requests = $user_obj->getNumberOfFriendRequests();
            ?>

            <a href="<?php echo $userLoggedIn; ?>"><?php echo $user['first_name']; ?></a>
            <a href="index.php">
                <i class="fa fa-home fa-lg"></i>
            </a>
            <a href="javascript:void(0);" onclick="getDropdownData('<?php echo $userLoggedIn; ?>', 'message')">
                <i class="fa fa-envelope-o fa-lg"></i>
                <?php
                if ($num_messages > 0) {
                    echo '<span class="notification_badge" id="unread_message">' . $num_messages . '</span>';
                }
                ?>
            </a>
            <a href="javascript:void(0);" onclick="getDropdownData('<?php echo $userLoggedIn; ?>', 'notification')">
                <i class="fa fa-bell-o fa-lg">
                    <?php
                    if ($num_notifications > 0) {
                        echo '<span class="notification_badge" id="unread_notification">' . $num_notifications . '</span>';
                    }
                    ?>
                </i>
            </a>
            <a href="requests.php">
                <i class="fa fa-users fa-lg">
                    <?php
                    if ($num_requests > 0) {
                        echo '<span class="notification_badge" id="unread_requests">' . $num_requests . '</span>';
                    }
                    ?>
                </i>
            </a>
            <a href="settings.php">
                <i class="fa fa-cog fa-lg"></i>
            </a>
            <a href="includes/handlers/logout.php">
                <i class="fa fa-sign-out fa-lg"></i>
            </a>
        </nav>

        <div class="dropdown_data_window" style="height:0px; border:none;"></div>
        <input type="hidden" id="dropdown_data_type" value="">

    </div>


    <script>
        //infinite loading message window
        $(function() {

            var userLoggedIn = '<?php echo $userLoggedIn; ?>';
            var dropdownInProgress = false;

            $(".dropdown_data_window").scroll(function() {
                var bottomElement = $(".dropdown_data_window a").last();
                var noMoreData = $('.dropdown_data_window').find('.noMoreDropdownData').val();

                // isElementInViewport uses getBoundingClientRect(), which requires the HTML DOM object, not the jQuery object. The jQuery equivalent is using [0] as shown below.
                if (isElementInView(bottomElement[0]) && noMoreData == 'false') {
                    loadPosts();
                }
            });

            function loadPosts() {
                if (dropdownInProgress) { //If it is already in the process of loading some posts, just return
                    return;
                }

                dropdownInProgress = true;

                var page = $('.dropdown_data_window').find('.nextPageDropdownData').val() || 1; //If .nextPage couldn't be found, it must not be on the page yet (it must be the first time loading posts), so use the value '1'

                var pageName; //Holds name of page to send ajax request to
                var type = $('#dropdown_data_type').val();

                if (type == 'notification')
                    pageName = "ajax_load_notifications.php";
                else if (type == 'message')
                    pageName = "ajax_load_messages.php";

                $.ajax({
                    url: "includes/handlers/" + pageName,
                    type: "POST",
                    data: "page=" + page + "&userLoggedIn=" + userLoggedIn,
                    cache: false,

                    success: function(response) {

                        $('.dropdown_data_window').find('.nextPageDropdownData').remove(); //Removes current .nextpage 
                        $('.dropdown_data_window').find('.noMoreDropdownData').remove();

                        $('.dropdown_data_window').append(response);

                        dropdownInProgress = false;
                    }
                });
            }

            //Check if the element is in view
            function isElementInView(el) {
                var rect = el.getBoundingClientRect();

                return (
                    rect.top >= 0 &&
                    rect.left >= 0 &&
                    rect.bottom <= (window.innerHeight || document.documentElement.clientHeight) && //* or $(window).height()
                    rect.right <= (window.innerWidth || document.documentElement.clientWidth) //* or $(window).width()
                );
            }
        });
    </script>


<!--BACKGROUND-->
    <img id="bgImage" src="assets/images/backgrounds/bg.gif" alt="">




    <div class="wrapper">
        <nav class="sidebar_scroll">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 128.69 128.69">
                <defs>
                    <style width="50px">
                        .cls-1 {
                            fill: #1ce8ff;
                            stroke: #000;
                            stroke-miterlimit: 10;
                        }

                        .outerRec {
                            fill: #0d0e30;
                        }
                    </style>
                </defs>
                <title>Home</title>
                <g id="Layer_2" data-name="Layer 2">
                    <g id="Layer_2-2" data-name="Layer 2">
                        <rect class="cls-1 outerRec" x="19.35" y="19.35" width="90" height="90" transform="translate(64.35 -26.65) rotate(45)" /><a href="index.php" class="diamond_neon">
                            <rect class="cls-1" x="38.93" y="38.96" width="50.95" height="50.95" transform="translate(-26.7 64.41) rotate(-45)" />
                        </a>
                    </g>
                </g>
            </svg></i>
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 128.69 128.69">
                <title>Messages</title>
                <g id="Layer_2" data-name="Layer 2">
                    <g id="Layer_2-2" data-name="Layer 2">
                        <rect class="cls-1 outerRec" x="19.35" y="19.35" width="90" height="90" transform="translate(64.35 -26.65) rotate(45)" /><a href="messages.php" class="diamond_neon">
                            <rect class="cls-1" x="38.93" y="38.96" width="50.95" height="50.95" transform="translate(-26.7 64.41) rotate(-45)" />
                        </a>
                    </g>
                </g>
            </svg>
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 128.69 128.69">
                <title>Friends</title>
                <g id="Layer_2" data-name="Layer 2">
                    <g id="Layer_2-2" data-name="Layer 2">
                        <rect class="cls-1 outerRec" x="19.35" y="19.35" width="90" height="90" transform="translate(64.35 -26.65) rotate(45)" /><a href="requests.php" class="diamond_neon">
                            <rect class="cls-1" x="38.93" y="38.96" width="50.95" height="50.95" transform="translate(-26.7 64.41) rotate(-45)" />
                        </a>
                    </g>
                </g>
            </svg>
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 128.69 128.69">
                <title>Settings</title>
                <g id="Layer_2" data-name="Layer 2">
                    <g id="Layer_2-2" data-name="Layer 2">
                        <rect class="cls-1 outerRec" x="19.35" y="19.35" width="90" height="90" transform="translate(64.35 -26.65) rotate(45)" /><a href="settings.php" class="diamond_neon">
                            <rect class="cls-1" x="38.93" y="38.96" width="50.95" height="50.95" transform="translate(-26.7 64.41) rotate(-45)" />
                        </a>
                    </g>
                </g>
            </svg>
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 128.69 128.69">
                <title>Logout</title>
                <g id="Layer_2" data-name="Layer 2">
                    <g id="Layer_2-2" data-name="Layer 2">
                        <rect class="cls-1 outerRec" x="19.35" y="19.35" width="90" height="90" transform="translate(64.35 -26.65) rotate(45)" /><a href="logout.php" class="diamond_neon">
                            <rect class="cls-1" x="38.93" y="38.96" width="50.95" height="50.95" transform="translate(-26.7 64.41) rotate(-45)" />
                        </a>
                    </g>
                </g>
            </svg>
        </nav>

        <div class="chat_box" onclick="getDropdownData('<?php echo $userLoggedIn; ?>', 'message2')">
            <a href="messages.php"><h4 id="messagetitle">Messages</h4></a>
            <p style="color:white;">Click to load your latest messages</p>
            <div class="dropdown_data_window2" style="height:0px; border:none;"></div>
            <input type="hidden" id="dropdown_data_type2" value="">
        </div>