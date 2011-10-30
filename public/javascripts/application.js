// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
  $("#events th a, #events .pagination a").live("click", function() {
    $.getScript(this.href);
    return false;
  });
  $("#events_search input").keyup(function() {
    $.get($("#events_search").attr("action"), $("#events_search").serialize(), null, "script");
    return false;
  });
});