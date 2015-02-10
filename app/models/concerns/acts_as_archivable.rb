module ActsAsArchivable
  extend ActiveSupport::Concern

  included do
    scope :active, -> { where(archived: false) }
    scope :archived, -> { where(archived: true) }
    # Allows a single archived item to be included in the "active" scope. Used in cases
    # where the currently selected item may be archived.
    scope :active_plus, ->(item_id=nil) {
      item_id ? where("#{table_name}.archived=false OR #{table_name}.id=?", item_id) : active
    }
  end

  def archive
    update_attribute :archived, true
  end

  def restore
    update_attribute :archived, false
  end
  
  def active?
    !archived
  end
  
  def archived?
    archived
  end
end
