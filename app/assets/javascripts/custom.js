$(document).ready(function(){
  $(".carousel-inner .item:first-child").addClass("active");

  $(".carousel").carousel("pause");

  $(".item img").click(function() {
    $(".fancybox").fancybox({
      speedIn : 600,
      speedOut : 200,
      padding : 2,
      helpers : {
        overlay : {
          locked : false
        }
      },
      beforeShow: function () {
        $(".fancybox-image").css({
          width : 700,
          height : 500
        });
        this.width = 700;
        this.height = 500;
      },
    });
  });

  $(".btn-action-show-images").on("click", function(e) {
    var icon = $(e.currentTarget).find("i");

    if (icon.hasClass("glyphicon-chevron-down")) {
      icon.removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-right");
    } else if (icon.hasClass("glyphicon-chevron-right")) {
      icon.removeClass("glyphicon-chevron-right").addClass("glyphicon-chevron-down");
    }

    $("#images-form").toggle("slow");
  });
});

function remove_fields(link) {
  var tabAddImage = $("#tab-add-image");
  li_current_active = tabAddImage.find("li.active");
  li_previous = li_current_active.prev();

  li_previous.attr("class", "active");
  li_current_active.remove();

  var tabContent = $(".tab-content");
  div_curr_active = tabContent.find("div.active");
  div_pre_active = div_curr_active.prev();
  div_pre_active.attr("class", "tab-pane active")
  div_curr_active.remove();

  if (tabContent.find("div").length === 0) {
    $("#images-form").hide("slow");
    $(".btn-action-show-images").attr("class", "btn-action-show-images btn btn-info toggler disabled");
    $(".btn-action-show-images").find("i").removeClass("glyphicon-chevron-down").addClass("glyphicon-chevron-right");
  }
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");

  var tabAddImage = $("#tab-add-image");
  tabAddImage.find("li.active").attr("class", "");

  var new_tab = ("<li class=\"active\"><a data-toggle=\"tab\" href=" + "#" + new_id + ">New Image</a></li>");
  tabAddImage.append(new_tab);

  var tabContent = $(".tab-content");
  tabContent.find("div.active").attr("class", "tab-pane fade");

  var divTabPane = ("<div id=" + new_id + " class= \"tab-pane active\">" + content.replace(regexp, new_id) + "</div>");
  tabContent.append(divTabPane);

  $(".btn-action-show-images").attr("class", "btn-action-show-images btn btn-info toggler active");
  $(".btn-action-show-images").find("i").removeClass("glyphicon-chevron-right").addClass("glyphicon-chevron-down");

  $("#images-form").show("slow");
}

$(".tooltip").tooltip();
