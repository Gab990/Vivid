<?php
//declare vars to prevent errors

$fname=""; //first name
$lname=""; //last name
$em=""; //email
$em2=""; //email confirmation
$password=""; //password
$password2=""; //password confirmation
$date=""; //sign up date
$error_array= array(); //error message

if(isset($_POST['register_button'])){
    //reg button has been pressed

    //First name
    $fname=strip_tags($_POST['reg_fname']); //gets rid of html tags
    $fname=str_replace(' ', '', $fname); //gets rid of spaces in the field
    $fname=ucfirst(strtolower($fname));//converts name to lowercase except for the first char
    $_SESSION['reg_fname'] = $fname; //stores value in session var

    //Last name
    $lname=strip_tags($_POST['reg_lname']); //gets rid of html tags
    $lname=str_replace(' ', '', $lname); //gets rid of spaces in the field
    $lname=ucfirst(strtolower($lname));//converts name to lowercase except for the first char
    $_SESSION['reg_lname'] = $lname; //stores value in session var

    //Email
    $em=strip_tags($_POST['reg_email']); //gets rid of html tags
    $em=str_replace(' ', '', $em); //gets rid of spaces in the field
    $em=ucfirst(strtolower($em));//converts name to lowercase except for the first char
    $_SESSION['reg_email'] = $em; //stores value in session var

    //Email 2
    $em2=strip_tags($_POST['reg_email2']); //gets rid of html tags
    $em2=str_replace(' ', '', $em2); //gets rid of spaces in the field
    $em2=ucfirst(strtolower($em2));//converts name to lowercase except for the first char
    $_SESSION['reg_email2'] = $em2; //stores value in session var

    //Password
    $password=strip_tags($_POST['reg_password']); //gets rid of html tags

    //Password 2
    $password2=strip_tags($_POST['reg_password2']); //gets rid of html tags

    $date = date("Y-m-d"); //current date

    if($em == $em2){
        //check if email is in valid format

        if(filter_var($em, FILTER_VALIDATE_EMAIL)){
            $em = filter_var($em, FILTER_VALIDATE_EMAIL);

            //check for existing email

            $e_check=mysqli_query($con, "SELECT email FROM users WHERE email='$em'");
            //count number of rows returned
            $num_rows = mysqli_num_rows($e_check);
            if($num_rows>0){
                array_push($error_array, "Email already in use<br>");
            }
        }
        else{
            array_push($error_array, "Invalid email format<br>");
        }
    }
    else{
        array_push($error_array, "Emails don't match<br>");
    }

    if(strlen($fname) > 25 || strlen($fname) < 2){
        array_push($error_array, "Your first name must be between 2 and 25 characters<br>");
    }

    if(strlen($lname) > 25 || strlen($lname) < 2){
        array_push($error_array, "Your last name must be between 2 and 25 characters<br>");
    }

    if($password != $password2){
        array_push($error_array, "Your passwords do not match<br>");
    }
    else {
        if(preg_match('/[^A-Za-z0-9]/', $password)) {
            array_push($error_array, "Your password can only contain english letters or numbers<br>");
        }
    }

    if(strlen($password > 30 || strlen($password) < 5)){
        array_push($error_array, "Your password must be between 5 and 30 characters<br>");
    }


    if(empty($error_array)){
        $password = md5($password); //encrypt password before adding to db
    
        //generate username by concatenating fname and lname
        $username = strtolower($fname . "_" . $lname);
        $check_username_query = mysqli_query($con,"SELECT username FROM users WHERE username='$username'");

        $i = 0;
        //if username exists, add number to the end of it
        while(mysqli_num_rows($check_username_query) != 0){
            $i++; //increment i
            $username = $username . "_" . $i;
            $check_username_query = mysqli_query($con, "SELECT username FROM users WHERE username='$username'");
        }

        //assign profile picture
        $rand = rand(1, 7); //random number between 1-16

        switch($rand) {
            case 1: 
                $profile_pic="assets/images/profile_pics/defaults/persona01.png";
                break;
            case 2: 
                $profile_pic="assets/images/profile_pics/defaults/persona02.png";
                break;
            case 3: 
                $profile_pic="assets/images/profile_pics/defaults/persona03.png";
                break;
            case 4:
                $profile_pic="assets/images/profile_pics/defaults/persona04.png";
                break;
            case 5:
                $profile_pic="assets/images/profile_pics/defaults/persona05.png";
                break;
            case 6:
                $profile_pic="assets/images/profile_pics/defaults/persona06.png";
                break;
            case 7:
                $profile_pic="assets/images/profile_pics/defaults/persona07.png";
                break;
            }

            $query = mysqli_query($con,"INSERT INTO users VALUES ('','$fname','$lname','$username','$em','$password','$date','$profile_pic','0','0','no',',')");
            $query2 = mysqli_query($con, "INSERT INTO vr_room VALUES ('','assets/models/Livingroomdone/Livingroomgood.glb','assets/models/Livingroom_assets/Livingroomlamp.gltf','assets/models/Livingroom_assets/Livingroomplant.gltf','assets/images/vr/skybox.png','$username','no')");
            
            array_push($error_array,"<span style='color: #14C800;'>You're all set! Go ahead and login!</span><br>");

            //clear session variables on success
            $_SESSION['reg_fname'] = "";
            $_SESSION['reg_lname'] = "";
            $_SESSION['reg_email'] = "";
            $_SESSION['reg_email2'] = "";
        
    }
}?>