
$(document).ready(function() {
    $('a.login-window').click(function() {
        
                //Getting the variable's value from a link 
        var loginBox = $(this).attr('href');

        //Fade in the Popup
        $(loginBox).fadeIn(300);
        
        //Set the center alignment padding + border see css style
        var popMargTop = ($(loginBox).height() + 24) / 2; 
        var popMargLeft = ($(loginBox).width() + 24) / 2; 
        
        $(loginBox).css({ 
            'margin-top' : -popMargTop,
            'margin-left' : -popMargLeft
        });
        
        // Add the mask to body
        $('body').append('<div id="mask"></div>');
        $('#mask').fadeIn(300);
        
        return false;
    });

    // When clicking on the button close or the mask layer the popup closed
    $('a.close, #mask').live('click', function() { 
        $('#mask , .login-popup').fadeOut(300 , function() {
         $('#mask').remove();  
        }); 
        return false;
    });

    $(".comment").click(function(event){
   $.ajax({
         url: $('.comment').attr('action'), 
         datatype: "JSON",
         method: "POST"
     })
     .success(function(result){    
     $("#comment").html(result);
     });
     event.preventDefault()
 }); 
});
