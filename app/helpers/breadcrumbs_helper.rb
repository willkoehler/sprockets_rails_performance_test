module BreadcrumbsHelper

  def breadcrumbs(breadcrumbs)
    @breadcrumbs = breadcrumbs.try(:compact)
  end
  
  def show_breadcrumbs?
    @breadcrumbs.present?
  end
  
  def breadcrumbs_suffix
    @breadcrumbs.length == 1 ? ' >' : ''
  end

  def render_breadcrumbs
    crumbs = @breadcrumbs.map { |breadcrumb| link_to sanitize(breadcrumb[0]), breadcrumb[1] }
    raw(crumbs.join(' > ') + breadcrumbs_suffix)
  end
end