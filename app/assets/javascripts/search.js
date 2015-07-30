$(document).ready(function() {
  function format_square(name) {
    $("select#" + name).find("option").each(function(i){
      var value = $(this).text(), new_option;
      new_option = "<option>" + value + " m&sup2" + "</option>";

      if(i !== 0)
        $(this).replaceWith(new_option);
    });
  }

  function min_change(name) {
    var text_select = parseInt($("#min_" + name + " option:selected").text(), 10);
    var max_lenght = $("#max_" + name + " option").size();

    $("#max_"+ name)[0].selectedIndex = 0;

    for(var i = 0; i < max_lenght; i++){
      var text_collect = parseInt($("#max_" + name).find("option").eq(i).text(), 10);

      if(text_select > text_collect)
        $("#max_" + name).find("option").eq(i).hide();
      else
        $("#max_" + name).find("option").eq(i).show();
    }
  }


  function max_change(name) {
    var text_select = parseInt($("#max_" + name + " option:selected").text(), 10);
    var min_lenght = $("#min_"+ name +" option").size();

    for(var i = 0; i < min_lenght; i++){
      var text_collect = parseInt($("#min_" + name).find("option").eq(i).text(), 10);

      if(text_select < text_collect)
        $("#min_" + name).find("option").eq(i).hide();
      else
        $("#min_" + name).find("option").eq(i).show();
    }
  }

  $(".checkbox").on("change", function() {
    $(".checkbox").not(this).prop("checked", false);
  });

  $("#address_search").submit(function(event) {
    var min_square = $("#min_square").val();
    var max_square = $("#max_square").val();
    var min_facility = $("#min_facility").val();
    var max_facility = $("#max_facility").val();
    var min_price = $("#min_price").val();
    var max_price = $("#max_price").val();
    var address = $("#address").val();
    var title = $("#title").val();

    if (min_square === "" && max_square === "" && min_facility === "" && max_facility === "" &&
      min_price === "" && max_price === "" && address === "" && title === "" && !$(".checkbox").is(":checked")) {
        event.preventDefault();
    }
  });

  $("select").change(function() {
    var id = $(this).attr("id");

    switch(id){
      case "min_square":
        min_change("square");
        break;
      case "max_square":
        max_change("square");
        break;
      case "min_price":
        min_change("price");
        break;
      case "max_price":
        max_change("price");
        break;
      case "min_facility":
        min_change("facility");
        break;
      case "max_facility":
        max_change("facility");
        break;
      default:
        console.log("Sorry, we are out of " + id + ".");
    }
  });

  $("select").each(function() {
    var name = $(this).attr("id");

    if(name === "min_square" || name === "max_square")
      format_square(name);
  });
});
