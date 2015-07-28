$(document).ready(function() {
  display_visited();

  var provinces = [];

  $(".visit").click(function() {
    save_link($(this));
  });

  function display_visited() {
    if (typeof localStorage["provinces"] === "undefined")
      document.getElementById("visited").style.display = "none";
    else
      document.getElementById("visited").style.display = "block";
  }

  function save_link(visit) {
    var adds_by_province = visit.data("adds-by-province");

    if (typeof localStorage["provinces"] !== "undefined") {
      provinces = JSON.parse(localStorage.provinces);
    }

    if ($.inArray(adds_by_province, provinces) === -1) {
      provinces.push(adds_by_province);
      localStorage["provinces"] = JSON.stringify(provinces);
    }
  }

  function show_visited() {
    if (typeof localStorage["provinces"] !== "undefined")
      provinces = JSON.parse(localStorage.provinces);

    for(var i = (provinces.length - 1); i >= 0; i--) {
      var d = new Date(provinces[i].created_at);
      var html = $(".visited-address").clone();

      html.removeClass("visited-address");

      thumb = html.find("div.address-thumb");
      thumb.prepend(provinces[i].image_tag);

      province_id = html.find("div.address-id");
      province_id.html("New code #" + provinces[i].id);

      link = html.find("a.visit");
      link.attr("href", "http://" + location.host + "/addresses/" + provinces[i].id);
      link.html(provinces[i].title)

      province_address = html.find("p.p-address");
      province_address.html(provinces[i].address);

      capacity = html.find("span.capacity");
      capacity.html(provinces[i].capacity);

      contact = html.find("span.contact");
      contact.html(provinces[i].contact);

      marker = html.find("span.glyphicon-map-marker");
      marker.attr("data-address-id", provinces[i].id);

      date = html.find("span.right");
      date.html(d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate()
        + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds()
        + " UTC");

      $("#visited").append(html);
    }
  }

  show_visited();
});
