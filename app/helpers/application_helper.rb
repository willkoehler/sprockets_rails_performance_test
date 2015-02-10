module ApplicationHelper
  include SearchHelper
  include ListContextHelper
  include ReturnToHelper
  include BreadcrumbsHelper
  include NavigationHelper

  # Inject page-specific javascript tag in page head (from http://railscasts.com/episodes/88)
  def javascript(*files)
    content_for :head, javascript_include_tag(*files)
  end
  
  def css_namespace(namespace)
    @css_namespace = namespace
  end

  def body_classes
    classes = []
    # add class based on controller name so we can namespace the css by controller
    # NOTE: params[:controller] includes the full controller namespace (i.e. rev_exp_months vs months)
    classes << params[:controller].gsub('/', '_')
    classes << action_name
    # additional, optional css namespace
    classes << @css_namespace if @css_namespace
    # add browser-specific classes to the body tag so we can apply browser-specific css
    classes << 'agent_ie8' if browser.ie8?
    classes << 'agent_ie9' if browser.ie9?
    classes << 'agent_ie10' if browser.ie10?
    classes << 'agent_ie11' if browser.ie11?
    classes << 'agent_ie' if browser.ie?
    classes << 'agent_firefox' if browser.firefox?
    classes << 'agent_safari' if browser.safari?
    classes << 'agent_chrome' if browser.chrome?
    classes << 'agent_ios' if browser.ios?
    classes << "agent_#{browser.platform}"
    classes.join(" ")
  end

  # Set page title, or get page title to be displayed
  def page_title(title=nil)
    if title
      content_for :title, title.to_s.html_safe  # (title is already sanitized in the view)
    else
      if content_for? :title
        "#{content_for :title} - Pathway"
      else
        "Pathway"
      end
    end
  end
end
