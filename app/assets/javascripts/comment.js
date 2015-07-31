$(document).ready(function(){
  $(".review .list-features a:last-child").click(function(){
    if($(this).next().length > 0){
      return false;
    }else{
      $(this).css("color", "#2e9fff");
    }
  });
});
