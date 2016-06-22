$(document).ready(function(){
    var timer;
    $("#peak-box").hover(
        function(){
             timer = setTimeout(function(){ $('#peak-data').show(400, 'swing'); }, 200);
        }, function(){
           clearTimeout(timer);
           $('#peak-data').hide(500, 'swing');
        }
    );
    $("#med-box").hover(
        function(){
             timer = setTimeout(function(){ $('#med-data').show(400, 'swing'); }, 200);
        }, function(){
           clearTimeout(timer);
           $('#med-data').hide(500, 'swing');
        }
    );
    $("#low-box").hover(
        function(){
             timer = setTimeout(function(){ $('#low-data').show(400, 'swing'); }, 200);
        }, function(){
           clearTimeout(timer);
           $('#low-data').hide(500, 'swing');
        }
    );
    $("#rest-box").hover(
        function(){
             timer = setTimeout(function(){ $('#rest-data').show(400, 'swing'); }, 200);
        }, function(){
           clearTimeout(timer);
           $('#rest-data').hide(500, 'swing');
        }
    );
     $("#heart-title").hover(
        function(){
             timer = setTimeout(function(){ $('#heart-date').show(100, 'swing'); }, 200);
        }, function(){
           clearTimeout(timer);
           $('#heart-date').hide(100, 'swing');
        }
    );
});

// $('#rest-box').hover(
//        function(){ $('#rest-data').toggle(500, 'swing'); }
// );