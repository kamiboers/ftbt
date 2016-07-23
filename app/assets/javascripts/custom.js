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
             timer = setTimeout(function(){ $('#heart-date').show(200, 'swing'); }, 1000);
        }, function(){
           clearTimeout(timer);
           $('#heart-date').hide(200, 'swing');
        }
    );

    $("#heart-card").hover(function(){
        $('#hvr-pulse').animate('pulse');
    }, function(){
        $('#hvr-pulse').animate('pulse');
    });


});


//  $("#create_playlist").click(function(){
//                 debugger;
//     $.post( 
//         "/api/v1/playlists",
//         JSON.stringify({   playlist: {title: $('#play_name').val(), 
//             intensity: $('#play_name').val(), 
//             genre: $('#play_name').val() }}),
//         function(data) {
//             console.log(data);
//         },
//         'json'
//     );
                    
// });
$('#create_playlist').click(function(){
    debugger;
 $.ajax({
    url: "/api/v1/playlists?name=" + $('#play_name').val() + "&intensity=" + $('#play_intensity').val() + "&genre=" + $('#play_genre').val() + "&user="+ $('#user_id').val(),
    dataType: 'json',
    type: 'post',
    contentType: 'application/json',
    processData: false,
    success: function( playlist ){
        console.log(playlist);
    },
    error: function( data, status, errorThrown ){
        console.log( errorThrown );
    }
});


});


//     $('#create_playlist').click(function() {
//         var title = $('#play_name').val();
//         var intensity = $('#play_intensity').val();
//         var genre = $('#play_genre').val();
//         var playAttributes = { playlist: { title: title, genre: genre, intensity: intensity } }
//         createPlaylist(playAttributes);
//     });

// function createPlaylist(attr){
//     debugger;
//     $.ajax({
//         url: '/api/v1/playlists',
//         type: 'POST',
//         // data: {     title: attr.playlist.title, 
//         //             intensity: attr.playlist.intensity, 
//         //             genre: attr.playlist.genre },
//         data: JSON.stringify(attr),
//         dataType: 'json',
//         success: function(playlist) {
//             console.log(playlist);
//             // $('.idea-box').html(prependFullRow(idea));
//             // $('#idea_title').val("");
//             // $('#idea_body').val("");
//             // $('#idea_tags').val("");
//         }
//     });
// }




