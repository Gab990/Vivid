<?php
include("includes/header.php");


if (isset($_POST['post'])) {

    $uploadOk = 1;
    $imageName = $_FILES['fileToUpload']['name'];
    $errorMessage = "";

    if ($imageName != "") {
        $targetDir = "assets/images/posts/";
        //to ensure no 2 images have the same name
        $imageName = $targetDir . $userLoggedIn . uniqid() . basename($imageName);
        $imageFileType = pathinfo($imageName, PATHINFO_EXTENSION);

        if ($_FILES['fileToUpload']['size'] > 20000000) {
            $errorMessage = "Sorry, your file is too large, max filesize is 2.5MB";
            $uploadOk = 0;
        }

        if ((strtolower($imageFileType) != "jpeg") && (strtolower($imageFileType) != "png") && (strtolower($imageFileType) != "jpg")) {

            $errorMessage = "Sorry, only .jpeg, .jpg and .png files are allowed!" . $imageFileType;
            $uploadOk = 0;
        }

        if ($uploadOk) {
            if (move_uploaded_file($_FILES['fileToUpload']['tmp_name'], $imageName)) {
                //image uploaded ok
            } else {
                //image didn't uplaod
                $uploadOk = 0;
            }
        }
    }

    if ($uploadOk) {
        $post = new Post($con, $userLoggedIn);
        $post->submitPost($_POST['post_text'], 'none', $imageName);
    } else {
        echo "<div style='text-align:center;' class='alert alert-danger'>
            $errorMessage
        </div>";
    }
}
?>
<div class="user_details column">
    <a href="<?php echo $userLoggedIn; ?>"> <img src="<?php echo $user['profile_pic']; ?>"></a>

    <div class="user_details_left_right">
        <a href="<?php echo $userLoggedIn; ?>">
            <?php
            echo $user['first_name'] . " " . $user['last_name'] . "<br>";
            ?>
        </a>
        <br>
        <?php echo "Posts: " . $user['num_posts'] . "<br>";
        echo "Likes: " . $user['num_likes'] . "<br>";
        echo "Joined: " . $user['signup_date'];
        ?>
    </div>
</div>

<div class="main_column column ">
    <form class="post_form" action="index.php" method="POST" enctype="multipart/form-data">
        <input type="file" name="fileToUpload" id="fileToUpload" hidden>
        <label id="sharePicButton" for="fileToUpload">Share a Pic!</label>
        <span id="file-chosen">No file chosen</span>
        <script>
            const actualBtn = document.getElementById('fileToUpload');

            const fileChosen = document.getElementById('file-chosen');

            actualBtn.addEventListener('change', function() {
                fileChosen.textContent = this.files[0].name;
            })
        </script>
        <br>
        <textarea name="post_text" id="post_text" placeholder="Post something!"></textarea>
        <input type="submit" name="post" id="post_button" value="Post">
        <hr>
    </form>

    <div class="posts_area"></div>
    <img src="assets/images/icons/loading.gif" alt="loading icon" id="loading" width="100" height="100">
</div>


<div class="user_details column">

    <h4>Popular terms</h4>
    <hr>
    <div class="trends">
        <?php
        $query = mysqli_query($con, "SELECT * FROM trends ORDER BY hits DESC LIMIT 9");

        foreach ($query as $row) {
            $word = $row['title'];
            $word_dot = strlen($word) >= 14 ? "..." : "";

            $trimmed_word = str_split($word, 14);
            $trimmed_word = $trimmed_word[0];

            echo "<div style='padding: 1px'>";
            echo $trimmed_word . $word_dot;
            echo "<br></div>";
        }
        ?>
    </div>
</div>

<div class="user_details column">
    <h4>Current version 0.8 <br> Open-beta version</h4>
    <hr>
    <h4>Version details:</h4>
    <ul>
        <li>Social network features are working, users can send and receive messages</li>
        <li>Posting and commenting is possible</li>
        <li>Registering works, users get added to db</li>
        <li>Friend-system in place, adding, removing friends are working</li>
        <li>VR room system in place, all users have their own rooms</li>
        <li>Popular terms are searched thoughout all posts in the db and showed</li>
        <li>Notification system works</li>
        <li>Like system works, used iframe so it updates without refreshing the whole page</li>
        <li>Endless scrolling system added</li>
        <li>User can change profile settings</li>
        <li>Users can close their accounts</li>
        <li>Added option to share videos and images based on feedback</li>
        <li>Added side navbar</li>
        <li>Added small message tab at the bottom</li>
        <li>Added a VR call feature. Mostly works, still have some issues that need to be fixed</li>
        <li>Most issues come from the new A-Frame and Three.js version. Will have to wait for the devs to update the components. Then the physics system and collision can be added</li>
    </ul>
</div>


<script>
    $(function() {
        var userLoggedIn = '<?php echo $userLoggedIn; ?>';
        var inProgress = false;

        loadPosts();

        $(window).scroll(function() {
            var bottomElement = $(".status_post").last();
            var noMorePosts = $(".posts_area").find(".noMorePosts").val();

            if (isElementInView(bottomElement[0]) && noMorePosts == 'false') {
                loadPosts();
            }
        });

        function loadPosts() { //if its already in the process of loading more posts
            if (inProgress) {
                return
            }

            inProgress = true;
            $('#loading').show();

            var page = $('.posts_area').find('.nextPage').val() || 1;

            //Original ajax request for loading first posts
            $.ajax({
                url: "includes/handlers/ajax_load_posts.php",
                type: "POST",
                data: "page=" + page + "&userLoggedIn=" + userLoggedIn,
                cache: false,

                success: function(response) {
                    $('.posts_area').find('.nextPage').remove();
                    $('.posts_area').find('.noMorePosts').remove();
                    $('.posts_area').find('noMorePostsText').remove();

                    $('#loading').hide();
                    $('.posts_area').append(response);

                    inProgress = false;
                }
            });
        }

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

</div>
<?php
include("includes/footer.php");
?>
