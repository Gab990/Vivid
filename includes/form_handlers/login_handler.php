<?php 

if(isset($_POST['login_button'])) {
    $email = filter_var($_POST['log_email'], FILTER_SANITIZE_EMAIL);

    $_SESSION['log_email'] = $email; //Stores email in session variable
    $password = md5($_POST['log_password']);

    $check_database_query = mysqli_query($con, "SELECT * FROM users WHERE email='$email' AND password='$password'");
    $check_login_query = mysqli_num_rows($check_database_query);

    if($check_login_query == 1){
        if(isset($_POST['check_box'])) {
            setcookie('email', $email, time() + 86400, "/");
            setcookie('password', $password, time() + 86400, "/");
       }
        $row = mysqli_fetch_array($check_database_query);
        $username = $row['username'];

        $user_closed_query=mysqli_query($con, "SELECT * FROM users WHERE email='$email' AND user_closed='yes'");
        if(mysqli_num_rows($user_closed_query) == 1) {
            $reopen_account = mysqli_query($con,"UPDATE users SET user_closed='no' WHERE email='$email'");
        }

        $_SESSION['username'] = $username; //to check if the user is logged in
        header("Location: index.php");
        exit();
    }

    else{
        array_push($error_array,"Email or password was incorrect<br>");
    }
}

?>