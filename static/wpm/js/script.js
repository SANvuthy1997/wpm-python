
// Phone Navbar
$(".button-collapse").sideNav();

// Search Button

$('#searchBtn').on('click',function(){
	$('#showSearch').show();
});
$('#closeBtn').on('click',function(){
	$('#showSearch').hide();
});

// Mouse Hover than dropdown

// $('.dropdown-button').dropdown({
//   inDuration: 400,
//   outDuration: 225,
//   hover: true, // Activate on hover
//   gutter: 0, // Spacing from edge
//   belowOrigin: false, // Displays dropdown below the button
//   alignment: 'left', // Displays dropdown with edge aligned to the left of button
//   stopPropagation: false // Stops event propagation
// }
// );


// Scroll up
$(document).ready(function(){ 
  $(window).scroll(function(){ 
    if ($(this).scrollTop() > 100) { 
      $('#scroll').fadeIn(); 
    } else { 
      $('#scroll').fadeOut(); 
    } 
  }); 
  $('#scroll').click(function(){ 
    $("html, body").animate({ scrollTop: 0 }, 600); 
    return false; 
  }); 
});

