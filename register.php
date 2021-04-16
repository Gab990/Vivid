<?php
require 'config/config.php';
require 'includes/form_handlers/register_handler.php';
require 'includes/form_handlers/login_handler.php';
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="assets/css/register_style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src='assets/js/lib/Tween.min.js' defer></script>
    <script src="assets/js/lib/perlin.js" defer></script>
    <script src="assets/js/lib/dat.gui.min.js" defer></script>
    <script src="assets/js/lib/three.js" defer></script>
    <script src="assets/js/lib/GLTFLoader.js" defer></script>
    <script src="assets/js/lib/OrbitControls.js" defer></script>
    <script src="assets/js/3d.js" defer></script>
    <script src="assets/js/regcanvas.js" defer></script>
    <script src="assets/js/register.js"></script>
</head>

<body id="regCanvas"> 

    <main id="">
        <div id="main-box" style="font-family:'Courier New', Courier, monospace;position:absolute;top:10%;left:2%;padding:10px; width:30%;border:2px solid yellow;">
            <h1 style="font-family:'Neuropol'">Welcome to Vivid-VR</h1>
            <div>
                <h2>About</h2>
                <h4>Vivid-VR is a university project created by 2 developers and a designer in approximately 12 weeks.
                    Vivid is a simple social platform with Virtual Reality features included.
                </h4>
            </div>
            <div>
                <h2>Team</h2>
                <h4>Our small team looks something like this:<br>
                    Eloic Lafine - Project management and front-end development<br>
                    Gabor Sebestyen - Back-end and VR feature development<br>
                    Mercedesz Kovacs - Designer, Concept Artist<br>
                    Alicja Jankojc - Sound Design<br>
                </h4>
            </div>
            <div>
                <h2>What can you do here?</h2>
                <h4>Vivid has the major elements present in other social media platforms, like messaging, posting, liking and adding friends.
                    That being said, the platform is more focused on the VR features than the social aspect as those provided greater challenge for the team.
                </h4>
            </div>
            <div>
                <h2>What's next?</h2>
                <h4>This project and site will only stay active for around a month in its current state. This will let us test the features and be assessed based on the project.
                    After that, who knows? The project is cool, so we might polish it and launch it proper.
                </h4>
            </div>
            
            <h5>Current version is 0.8</h5>
        </div>
        <div class="regWrapper">

            <?php
            if (isset($_POST['register_button'])) {
                echo '
        <script>
        $(document).ready(function(){
            $("#first").hide();
            $("#second").show();
        });


        </script>
        ';
            }
            ?>
            <div class="wrapper">

                <div class="login_box">
                    <img width="200" height="200" style="position:absolute;top:10%;" src="assets/images/icons/logo.png">
                    <div class="login_header">
                        <h1>Welcome to Vivid</h1>
                        <p>Login to your account</p>
                    </div>
                    <div id="first">
                        <form action="register.php" method="POST">
                            <input type="email" name="log_email" placeholder="Email Address" value="<?php
                                                                                                    if (isset($_SESSION['log_email'])) {
                                                                                                        echo $_SESSION['log_email'];
                                                                                                    } ?>" required>
                            <br>
                            <input type="password" name="log_password" placeholder="Password">
                            <br>
                            <input type="submit" name="login_button" value="Login">
                            <br><br>
                            <input onclick="cookieRemind()" type="checkbox" name="check_box">Remember me<br>
                            <?php if (in_array("Email or password was incorrect<br>", $error_array)) echo "<p class='error'>Email or password was incorrect</p><br>"; ?>
                            <br>
                            <a href="#" id="signup" class="signup">Need an account? Register here!</a>
                        </form>

                    </div>


                    <div id="second">
                        <form action="register.php" method="POST">
                            <input type="text" name="reg_fname" placeholder="First name" value="<?php
                                                                                                if (isset($_SESSION['reg_fname'])) {
                                                                                                    echo $_SESSION['reg_fname'];
                                                                                                } ?>" required>
                            <br>
                            <?php if (in_array("Your first name must be between 2 and 25 characters<br>", $error_array)) echo "<p class='error'>Your first name must be between 2 and 25 characters</p><br>"; ?>

                            <input type="text" name="reg_lname" placeholder="Last name" value="<?php
                                                                                                if (isset($_SESSION['reg_lname'])) {
                                                                                                    echo $_SESSION['reg_lname'];
                                                                                                } ?>" required>
                            <br>
                            <?php if (in_array("Your last name must be between 2 and 25 characters<br>", $error_array)) echo "<p class='error'>Your last name must be between 2 and 25 characters</p><br>"; ?>

                            <input type="email" name="reg_email" placeholder="Email" value="<?php
                                                                                            if (isset($_SESSION['reg_email'])) {
                                                                                                echo $_SESSION['reg_email'];
                                                                                            } ?>" required>
                            <br>
                            <input type="email" name="reg_email2" placeholder="Confirm Email" value="<?php
                                                                                                        if (isset($_SESSION['reg_email2'])) {
                                                                                                            echo $_SESSION['reg_email2'];
                                                                                                        } ?>" required>
                            <br>
                            <?php if (in_array("Email already in use<br>", $error_array)) echo "<p class='error'>Email already in use</p><br>";
                            else if (in_array("Invalid email format<br>", $error_array)) echo "<p class='error'>Invalid email format</p><br>";
                            else if (in_array("Emails don't match<br>", $error_array)) echo "<p class='error'>Emails don't match</p><br>"; ?>

                            <p><i>Password has to be 5 characters or longer!</i></p>
                            <input type="password" name="reg_password" placeholder="Password" required>
                            <br>
                            <input type="password" name="reg_password2" placeholder="Confirm Password" required>
                            <br>
                            <?php if (in_array("Your passwords do not match<br>", $error_array)) echo "<p class='error'>Your passwords do not match</p><br>";
                            else if (in_array("Your password can only contain english letters or numbers<br>", $error_array)) echo "<p class='error'>Your password can only contain english letters or numbers</p><br>";
                            else if (in_array("Your password must be between 5 and 30 characters<br>", $error_array)) echo "<p class='error'>Your password must be between 5 and 30 characters</p><br>"; ?>

                            <input type="submit" name="register_button" value="Register">
                            <br>
                            <?php if (in_array("<span style='color: #14C800; font-family:Neuropol'>You're all set! Go ahead and login!</span><br>", $error_array)) echo "<span style='color: #14C800;'>You're all set! Go ahead and login!</span><br>"; ?>
                            <br>
                            <a href="#" id="signin" class="signin">Already have an account? Sign in here!</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <div class="overlay">
        Cookies are stored on your computer so you don't have to log in every time!
    </div>

    <script>
        let element = document.querySelector(".overlay");
        element.style.display = "none";

        function cookieRemind() {
            element.style.display = "block";
        }
    </script>

</body>

</html>