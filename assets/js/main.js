$(document).ready(function(){

    //Button for profile post
    $('#submit_profile_post').click(function(){

        $.ajax({
            type: "POST",
            url: "includes/handlers/ajax_submit_profile_post.php",
            data: $('form.profile_post').serialize(),
            success: function(msg) {
                $("#post_form").modal('hide');
                location.reload();
            },
            error: function(XMLHttpRequest, textStatus, errorThrown){
                console.log("Error: " + errorThrown);
                console.log("Status: " + textStatus);
                alert('Failure');
            }
        });

    });

    $('#VRwindow').hide();

    $('#vr_button').click(function(){
        $('#VRwindow').show();
    });

});