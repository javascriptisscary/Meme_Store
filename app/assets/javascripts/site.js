$(document).on('page:change', function(){
    $('a.fancybox').fancybox({ parent: "body"});
    $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
    $('.rated').raty({ path: '/assets', readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
      
    });
    
});

