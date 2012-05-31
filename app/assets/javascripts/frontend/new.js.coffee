$(document).on 'click', '.slide .heading a.toggle', ->
  $(this).closest('.slide').toggleClass('active')
  $(this).closest('.slide').find('.content').slideToggle(100)
  
$(document).on 'change', '.page-type-select', ->
  $(this).closest('.slide').find('.heading a.toggle').html($(this).val())
  $(this).closest('.form-horizontal').find(".page-type").hide();
  $(this).closest('.form-horizontal').find(".page-type[data-page-type='" + $(this).val() + "']").show()
  
$(document).on 'click', '.new-slide-btn', ->
  $("#template-slide")
    .clone()
    .prependTo('.slides')
    .attr('id', '')
    .find('.heading a.toggle')
    .trigger('click')
  
$(document).on 'click', '#delete-slide', ->
  if confirm("Are you sure?")
    $(this).closest('.slide').remove()
    
    
$(document).on 'click', '#submit-btn', (e) ->
  e.preventDefault()
  el = $(this)
  # el.button('loading')
  project = {
    hub_id: $("#hub_id").val(),
    name: $("#name").val(),
    email: $("#email").val(),
    logo: $("#logo").val(),
    misc_image: $("#misc_image").val(),
    slides: []
  }
  
  $(".slide").not("#template-slide").each ->
    
    slideEl = $(this)
    slide = {content: {}}
    
    return if slideEl.find("#page_type").val() == "Select a page type..."
    
    slide.page_type = slideEl.find("#page_type").val()
    
    switch slideEl.find("#page_type").val()
      when "Big Text" 
        slide.content.text = $("#big_text_text").val()
      when "Big Photo" 
        slide.content.url = $("#big_photo_url").val()
      when "Text and Photo" 
        slide.content.text = $("#text_and_photo_text").val()
        slide.content.url = $("#text_and_photo_url").val()
      when "Contact Info" 
        slide.content.mailing_address = $("#contact_info_mailing_address").val()
        slide.content.phone = $("#contact_info_phone").val()
        slide.content.website = $("#contact_info_website").val()
        slide.content.twitter = $("#contact_info_twitter").val()
        slide.content.facebook = $("#contact_info_facebook").val()
        slide.content.blog = $("#contact_info_blog").val()
      when "Team Bios" 
        slide.content.member_1_name = $("#team_bios_member_1_name").val()
        slide.content.member_1_title = $("#team_bios_member_1_title").val()
        slide.content.member_1_photo = $("#team_bios_member_1_photo").val()
        slide.content.member_2_name = $("#team_bios_member_2_name").val()
        slide.content.member_2_title = $("#team_bios_member_2_title").val()
        slide.content.member_2_photo = $("#team_bios_member_2_photo").val()
        
    project.slides.push(slide)
    
    project.slides = JSON.stringify(project.slides)
  
  console.log(project)    
  
  $.ajax el.data('submit-url'),
    type: el.data('method'),
    data: 
      project: project,
    success: (data) ->
      alert(data)
    
  
$ ->
  $(".page-type-select").trigger('change')
  $(".slides#sortable").sortable();