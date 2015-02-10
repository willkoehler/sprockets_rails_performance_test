# If this continues to grow, these may be broken into separate files similar to Active Support core extensions.
# For now it seems easier to keep all the app's core extensions in a single place.

class Date
  def self.num_months_in(range)
    (range.last.year * 12 + range.last.month) - (range.first.year * 12 + range.first.month) + 1
  end
end

class String
  def if_empty(substitute)
    empty? ? substitute : self
  end
end