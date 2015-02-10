module ReturnToHelper
  
  # Return to path
  
  def check_referrer_stack
    @popping_stack = popping_stack?
    @is_page_reload = page_reload?
    referrer_stack.pop if @popping_stack
    referrer_stack.shift if referrer_stack.count >= 5
  end

  def return_to(url)
    referrer_stack.push url unless @popping_stack || @is_page_reload || url.blank?
  end
  
  def redirect_back(*args)
    redirect_to(return_to_url, *args)
  end

  def return_to_url(params = { or: root_path })
    referrer_stack.last || params[:or]
  end
  
  private
  
    def referrer_stack
      session[:referrer_stack] ||= []
    end

    def popping_stack?
      (referrer_stack.last == request.original_url) && request.method == 'GET'
    end
  
    def page_reload?
      is_page_reload = (session[:previous_request_url] == request.original_url)
      session[:previous_request_url] = request.original_url
      is_page_reload
    end
end