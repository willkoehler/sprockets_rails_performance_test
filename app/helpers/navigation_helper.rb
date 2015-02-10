module NavigationHelper
  def highlight_nav(item)
    @highlight_nav = item
  end

  def highlight_nav_if(item)
    (item == @highlight_nav) ? "active" : nil
  end
  
  def highlight_subnav(item)
    @highlight_subnav = item.try(:to_sym)
  end

  def highlight_subnav_if(item)
    item == @highlight_subnav ? "active" : nil
  end
end