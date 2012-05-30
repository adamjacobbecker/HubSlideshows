$(document).on 'click', '.slide .heading a.toggle', ->
  $(this).closest('.slide').toggleClass('active')
  $(this).closest('.slide').find('.content').slideToggle(100)
  
$(document).on 'change', '.page-type-select', ->
  $(this).closest('.slide').find('.heading a.toggle').html($(this).val())
  $(this).closest('.form-horizontal').find(".page-type").hide();
  $(this).closest('.form-horizontal').find(".page-type[data-page-type='" + $(this).val() + "']").show()
  
$ ->
  $(".page-type-select").trigger('change')