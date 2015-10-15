$(document).ready(function() {
    $("#machine_filter input").keyup(function() {
    $.get($("#machine_filter").attr("action"), $("#machine_filter").serialize(), null, "script");
    return false;
  });
});