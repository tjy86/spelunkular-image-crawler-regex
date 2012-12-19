$(function(){
  $('#submit').click(whatup);
  $('#images').append();
});

function whatup () {
  url = $('#url').val();
  depth = $('#depth').val();
  $.ajax({
  type: "POST",
  url: "/data",
  data: { url: url, depth: depth }
  }).done(function( msg ) {
  alert( "Data Saved: " + msg );
});

}