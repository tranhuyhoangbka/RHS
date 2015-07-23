$(document).ready(function() {
  $("#sort").change(function() {
    $("form:first").submit();
  });

  var text = $("#result").text();

  if (text !== "") {
    var opt_lenght = $("#sort").find("option").size();
    
    for (var i = 0; i < opt_lenght; i++) {
      var opt_select =  $("#sort").find("option").eq(i).text();
      if (text === opt_select) {
        document.getElementById("sort").selectedIndex = i;
        break;
      }
    }  
  }
});
