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
 
    @slide_params[:x] = @slide_params[:orig_x] + 3500
    
    if @slide_params[:page_count] == 3
      @slide_params[:x] -= 1000
    elsif @slide_params[:page_count] <= 2
      @slide_params[:x] -= 1500      
    end
    
    @slide_params[:y] = @slide_params[:orig_y]   
    
    @slide_params[:page_count] = 1
    @slide_params[:project_count] += 1
  end

end