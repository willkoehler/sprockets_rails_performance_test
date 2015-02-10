module SearchHelper

  def not_found_message
    current_user.admin? ? 'No hopitals or users were found' : 'No users were found'
  end
  
  def search_placeholder
    current_user.admin? ? 'Find hospitals and users' : 'Find people'
  end
end