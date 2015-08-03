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

    for (var i = 0; i < max_lenght; i++) {
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

  $("#address_search").submit(function(event) {
    var min_square = $("#min_square").val();
    var max_square = $("#max_square").val();
    var min_price = $("#min_price").val();
    var max_price = $("#max_price").val();
    var address = $("#address").val();
    var keyword = $("#keyword").val();
    var park1 = $("#park1").is(":checked");
    var park2 = $("#park2").is(":checked");
    var air_con1 = $("#air_con1").is(":checked");
    var air_con2 = $("#air_con2").is(":checked");
    var fan1 = $("#fan1").is(":checked");
    var fan2 = $("#fan2").is(":checked");
    var wash1 = $("#wash1").is(":checked");
    var wash2 = $("#wash2").is(":checked");
    var tv1 = $("#tv1").is(":checked");
    var tv2 = $("#tv2").is(":checked");
    var network1 = $("#network1").is(":checked");
    var network2 = $("#network2").is(":checked");
    var table1 = $("#table1").is(":checked");
    var table2 = $("#table2").is(":checked");
    var chair1 = $("#chair1").is(":checked");
    var chair2 = $("#chair2").is(":checked");
    var bed1 = $("#bed1").is(":checked");
    var bed2 = $("#bed2").is(":checked");

    if (min_square === "" && max_square === "" &&
      min_price === "" && max_price === "" && address === "" && keyword === "" &&
      !park1 && !park2 && !air_con1 && !air_con2 && !fan1 && !fan2 &&
      !wash1 && !wash2 && !tv1 && !tv2 && !network1 && !network2 &&
      !table1 && !table2 && !chair1 && !chair2 && !bed1 && !bed2) {
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
      default:
        console.log("Sorry, we are out of " + id + ".");
    }
  });

  $("select").each(function() {
    var name = $(this).attr("id");

    if(name === "min_square" || name === "max_square")
      format_square(name);
  });

  $("#advance_search").click(function(){
    $("#content_advance_search").slideToggle();
  });
});
