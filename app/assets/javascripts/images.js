$(function(){
  $('#submit').click(whatup);
  
});

function whatup () {
  url = $('#url').val();
  depth = $('#depth').val();
  $.ajax({
  type: "POST",
  url: "/data",
  data: { url: url, depth: depth }
  }).done(function( msg ) {
    console.log(msg);
    // $('#images').append();
});



}