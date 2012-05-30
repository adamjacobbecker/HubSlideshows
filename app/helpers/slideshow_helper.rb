module SlideshowHelper

  def partial_name_from(page_type)
    page_type.downcase.gsub(/\s/, '_')
  end

  def before_project
    @slide_params[:orig_x] = @slide_params[:x]
    @slide_params[:orig_y] = @slide_params[:y]
  end

  def after_page
  
    if @slide_params[:page_count] % 3 == 0
      @slide_params[:x] -= 2000
    else
      @slide_params[:x] += 1000
    end
  
    if @slide_params[:page_count] % 3 == 0
      @slide_params[:y] += 700 
    end
  
    @slide_params[:page_count] += 1
  end

  def after_project
    
    @slide_params["total_pages_for_#{@slide_params[:project_count]}"] = @slide_params[:page_count]
    @slide_params["max_y_for_#{@slide_params[:project_count]}"] = @slide_params[:y]
    
    @last_row_most_slides = ([@slide_params["total_pages_for_#{@slide_params[:project_count]}"],
                             (@slide_params["total_pages_for_#{@slide_params[:project_count] - 1}"] || 1)]).max
                             
    @last_row_max_y = ([@slide_params["max_y_for_#{@slide_params[:project_count]}"],
                            (@slide_params["max_y_for_#{@slide_params[:project_count] - 1}"] || 1)]).max
    
                        
    if @last_row_most_slides < 3
      @last_row_height = 1000
    elsif @last_row_most_slides < 6
      @last_row_height = 1400
    elsif @last_row_most_slides < 9
      @last_row_height = 1400
    else
      @last_row_height = 1700
    end
    
    if @slide_params[:project_count] % 2 == 0
      @slide_params[:x] = 0
      @slide_params[:y] = @last_row_max_y + @last_row_height
    else
      @slide_params[:x] = @slide_params[:orig_x] + 3500
      @slide_params[:y] = @slide_params[:orig_y]   
    end
    
    @slide_params[:page_count] = 1
    @slide_params[:project_count] += 1
  end

end