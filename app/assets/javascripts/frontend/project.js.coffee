$(document).on 'click', '.slide .heading a.toggle', ->
  $(this).closest('.slide').toggleClass('active')
  $(this).closest('.slide').find('.content').slideToggle(100)
  
$(document).on 'change', '.page-type-select', ->
  $(this).closest('.slide').find('.heading a.toggle').html($(this).val())
  $(this).closest('.form-horizontal').find(".page-type").hide();
  $(this).closest('.form-horizontal').find(".page-type[data-page-type='" + $(this).val() + "']").show()


$(document).on 'change', '.upload-form', ->
  el = $(this)
  target = $("#" + el.data('url-input'))
  $(this).ajaxSubmit
    beforeSubmit: (a,f,o) ->
      o.dataType = 'json'
      el.find('.file-controls').addClass 'uploading'
    success: (data) ->
      if data.asset_url
        if el.closest('.slide').length > 0
          el.closest('.slide').find('#' + el.data('url-input')).val(data.asset_url)
        else        
          target.val(data.asset_url)
        
        el.find('.file-controls').removeClass 'uploading'
        el.find('.file-controls').addClass 'uploaded'
      else
        alert 'Sorry, an error occured.'


$(document).on 'click', '.new-slide-btn', ->
  $('.slide')
    .removeClass('active')
    .find('.content').slideUp(100)
  
  $("#template-slide")
    .clone()
    .appendTo('.slides')
    .attr('id', '')
    .find('.heading a.toggle')
    .trigger('click')
  
$(document).on 'click', '#delete-slide', ->
  if confirm("Are you sure you want to delete this slide?")
    $(this).closest('.slide').remove()
    
    
$(document).on 'click', '#submit-btn', (e) ->
  e.preventDefault()
  el = $(this)
  el.button('loading')
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
        slide.content.text = slideEl.find("#big_text_text").val()
      when "Big Photo" 
        slide.content.url = slideEl.find("#big_photo_url").val()
      when "Text and Photo" 
        slide.content.text = slideEl.find("#text_and_photo_text").val()
        slide.content.url = slideEl.find("#text_and_photo_url").val()
      when "Contact Info" 
        slide.content.mailing_address = slideEl.find("#contact_info_mailing_address").val()
        slide.content.phone = slideEl.find("#contact_info_phone").val()
        slide.content.website = slideEl.find("#contact_info_website").val()
        slide.content.twitter = slideEl.find("#contact_info_twitter").val()
        slide.content.facebook = slideEl.find("#contact_info_facebook").val()
        slide.content.blog = slideEl.find("#contact_info_blog").val()
      when "Team Bios" 
        slide.content.member_1_name = slideEl.find("#team_bios_member_1_name").val()
        slide.content.member_1_title = slideEl.find("#team_bios_member_1_title").val()
        slide.content.member_1_photo = slideEl.find("#team_bios_member_1_photo").val()
        slide.content.member_2_name = slideEl.find("#team_bios_member_2_name").val()
        slide.content.member_2_title = slideEl.find("#team_bios_member_2_title").val()
        slide.content.member_2_photo = slideEl.find("#team_bios_member_2_photo").val()
        
    project.slides.push(slide)
      
  console.log(project)    
  
  $.ajax el.data('submit-url'),
    type: el.data('method'),
    data: 
      project: JSON.stringify(project),
    success: (data) ->
      if el.data('method') == 'POST'
        if data.edit_project_path
          el.button 'reset'
          $("#project-page").slideUp 500, ->
            $("#success-page").fadeIn 300
          $("#edit-project-path")
            .html(data.edit_project_path)
            .attr('href', data.edit_project_path)
        else
          alert 'Dang, an error occured.'
          el.button 'reset'
      else
        if data.edit_project_path
          el.button 'reset'
          el.parent()
            .find('.saved')
            .show()
            .delay('2000')
            .fadeOut('200')
        else
          alert 'Dang, an error occured.'
          el.button 'reset'
  
$ ->
  $(".page-type-select").trigger('change')
  $(".slides#sortable").sortable();