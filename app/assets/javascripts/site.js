
//for reuse raty
function ratings(){
    
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets', readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
      
    });
    
};


$(document).on('page:change', function(){
$(".products").hover(function() {
    $(this).css("border", "3px solid red" );
}, function() {
    $(this).css("border", "3px solid black");
});
$('a.fancybox').fancybox({ parent: "body"});
//call ratings
ratings();
});

