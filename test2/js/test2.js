$(document).on('pageinit', function(){
  //submiting
  $("#test2").submit(function() {   
  	$.ajax({
           type: "POST",
           url: "./check.php",
           data: $("#test2").serialize(), // serializes the form's elements.
           success: function(data)
           {
           		$.each( JSON.parse(data), function( key, value ) {
           		  $("#popup-label-"+key).html(value.name);
           		  $("#popup-"+key).html(value.result);
           		});
           		$("#popupDialog").popup("open");
           },
           error: function() {
             alert("something went terribly wrong");
           }
         });
    return false;
  });
  
});

$(document).on('pageinit', function(){
  //$("#popupDialog").hide();
});
