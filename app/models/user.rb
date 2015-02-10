class User < ActiveRecord::Base
  include ActsAsArchivable
  devise :database_authenticatable, :recoverable, :timeoutable

  enum role: { admin: 0, regional_director: 1, director: 2, customer: 3 }

  attr_accessor :current_password
  
  validates :name, presence: true,
                   length: { maximum: 100 }
  validates :role, presence: true
  validates :email, presence: true,
                    email: true,
                    uniqueness: { case_sensitive: false, message: "there is already a user with this email" }
  validates :password, length: { within: 6..40 }, allow_blank: true
  validates :password, presence: { :on => :create }               # password always required on create
  validates :password, presence: true, unless: 'password.nil?'    # password cannot be empty if present in params
  validates :password, confirmation: true

  scope :default_sort, -> { order(:name) }
  scope :by_role, ->(role) { where(role: roles[role]) }
  scope :grid_fields, -> { select([:id, :name, :title, :role, :email]) }
  # called by Devise to determine if user can login
  def active_for_authentication?
    can_login && !archived
  end

  # message displayed by Devise if active_for_authentication? is false
  def inactive_message
    :not_found_in_database
  end
    
  def entity_name
    "PSISCS"
  end
end