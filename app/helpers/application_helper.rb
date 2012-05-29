module ApplicationHelper
  def full_title(page_title)
    base_title = "Hub Slideshows"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def all_hubs
    hubs = {}
    Hub.all.each do |hub|
      hubs[hub.name] = hub.id
    end
    hubs
  end
  
  def all_page_types
    return [nil, 'Big Text', 'Big Photo', 'Text and Photo', 'Team Bios', 'Contact Info']
  end
    
end
