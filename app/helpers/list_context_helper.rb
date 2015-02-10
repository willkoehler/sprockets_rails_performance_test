module ListContextHelper

  def save_list_context(text, params = {})
    clear_list_context
    session[:list_context_path] = request.fullpath
    session[:list_context_text] = text
    session[:list_context_controller] = controller_name unless params[:global]
  end
  
  # List contexts are specific to the controller. Clear the list context when controller changes
  def valid_list_context?(params = { for: controller_name } )
    if session[:list_context_controller] && session[:list_context_controller] != params[:for]
      clear_list_context
    else
      # List context controller will be set here if save_list_context is called with global: true
      session[:list_context_controller] = params[:for]
    end
    has_list_context?
  end
  
  def redirect_to_list_context_or(default_path, *args)
    if valid_list_context?
      redirect_to session[:list_context_path], *args
    else
      redirect_to default_path, *args
    end
  end

  def list_context_breadcrumb
    [session[:list_context_text], session[:list_context_path]]
  end

  private

    def has_list_context?
      session[:list_context_text].present?
    end
  
    def clear_list_context
      session.delete(:list_context_path)
      session.delete(:list_context_text)
      session.delete(:list_context_controller)
    end

end