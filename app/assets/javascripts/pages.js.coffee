$(document).on "change", "#page-type-select", ->
  $(".page-type").hide();
  $(".page-type[data-page-type='" + $("#page-type-select").val() + "']").show()
  
$ ->
  $("#page-type-select").trigger('change')