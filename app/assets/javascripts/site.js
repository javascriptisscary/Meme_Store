
//for reuse raty
function ratings(){
    
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets', readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
      
    });
    
};


//hide alerts and notices after a few seconds
function hide() {
    $('.notice').css({"transition": "opacity 7s ease-in-out",
                            "-moz-transition": "opacity 7s ease-in-out",
                            "-webkit-transition": "opacity 7s ease-in-out",
                            "opacity": "0"
                            })
}




$(document).on('page:change', function(){
$(".products").hover(function() {
    $(this).css({"border": "1px solid red", "transition": "border 0.1s linear 0.1s"}  );
}, function() {
    $(this).css("border", "1px solid black" );
});
$('a.fancybox').fancybox({ parent: "body"});
//call ratings
ratings();
});

