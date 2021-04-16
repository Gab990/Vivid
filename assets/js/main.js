$(document).ready(function () {


    //search form expand
    $('#search_text_input').focus(function () {
        if (window.matchMedia("(min-width: 800px)").matches) {
            $(this).animate({ width: '250px' }, 500);
        }
    });

    //search img click
    $('.button_holder').on('click', function () {
        document.search_form.submit();
    });



    //Button for profile post
    $('#submit_profile_post').click(function () {

        $.ajax({
            type: "POST",
            url: "includes/handlers/ajax_submit_profile_post.php",
            data: $('form.profile_post').serialize(),
            success: function (msg) {
                $("#post_form").modal('hide');
                location.reload();
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                console.log("Error: " + errorThrown);
                console.log("Status: " + textStatus);
                alert('Failure');
            }
        });

    });

});

//hide all results when clicking away
$(document).click(function (e) {
    if (e.target.class != "search_results" && e.target.id != "search_text_input") {

        $(".search_results").html("");
        $(".search_results_footer").html("");
        $(".search_results_footer").toggleClass("search_results_footer_empty");
        $(".search_results_footer").toggleClass("search_results_footer");
    }

    if (e.target.class != "dropdown_data_window") {

        $(".dropdown_data_window").html("");
        $(".dropdown_data_window").css({ "padding": "0px", "height": "0px" });
    }
});



function getUser(value, user) {
    $.post("includes/handlers/ajax_friend_search.php", { query: value, userLoggedIn: user }, function (data) {
        $(".results").html(data); //will set the value of the results div as value and user        
    });
}

function getDropdownData(user, type) {

    if ($(".dropdown_data_window").css("height") == "0px") {

        var pageName;

        if (type == 'notification') {
            pageName = "ajax_load_notifications.php";
            $("span").remove("#unread_notification");
        }

        else if (type == 'message') {
            pageName = "ajax_load_messages.php";
            $("span").remove("#unread_message");
        }

        else if (type == 'message2') {
            pageName = "ajax_load_messages_2.php";
            $("span").remove("#unread_message");
        }

        var ajaxreq = $.ajax({
            url: "includes/handlers/" + pageName,
            type: "POST",
            data: "page=1&userLoggedIn=" + user,
            cache: false,

            success: function (response) {
                if (pageName == "ajax_load_messages.php" || pageName == "ajax_load_notifications.php") {
                    $(".dropdown_data_window").html(response);
                    $(".dropdown_data_window").css({ "padding": "0px", "height": "280px", "border": "1px solid #DADADA" });
                    $("#dropdown_data_type").val(type);
                }
                else {
                    $(".dropdown_data_window2").html(response);
                    $(".dropdown_data_window2").css({ "padding": "0px", "height": "fit-content" });
                    $("#dropdown_data_type2").val(type);
                }
            }
        });
    }

    else {
        $(".dropdown_data_window").html("");
        $(".dropdown_data_window").css({ "padding": "0px", "height": "0px", "border": "none" });
    }
}

function getLiveSearchUsers(value, user) {

    $.post("includes/handlers/ajax_search.php", { query: value, userLoggedIn: user }, function (data) {

        //if empty dropdown, toggle it
        if ($(".search_results_footer_empty")[0]) {
            $(".search_results_footer_empty").toggleClass("search_results_footer");
            $(".search_results_footer_empty").toggleClass("search_results_footer_empty");
        }

        //if matches are found
        $(".search_results").html(data);
        $(".search_results_footer").html("<a href='search.php?q=" + value + "'>See All Results</a>");


        //if no matches are found
        if (data == "") {
            $(".search_results_footer").html("");
            $(".search_results_footer").toggleClass("search_results_footer_empty");
            $(".search_results_footer").toggleClass("search_results_footer");
        }
    });
}


// // request permission on page load
// document.addEventListener('DOMContentLoaded', function () {
//     if (Notification.permission !== "granted")
//       Notification.requestPermission();
//   });
  
//   function notifyMe() {
//     if (!Notification) {
//       alert('Desktop notifications not available in your browser. Try Chromium.'); 
//       return;
//     }
  
//     if (Notification.permission !== "granted")
//       Notification.requestPermission();
//     else {
//       var notification = new Notification('Notification title', {
//         icon: 'http://cdn.sstatic.net/stackexchange/img/logos/so/so-icon.png',
//         body: "Hey, something happened on Vivid-VR!"
//       });
  
//     }
  
//   }