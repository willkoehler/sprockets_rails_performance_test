class Ability
  include CanCan::Ability
  
  def initialize(user)
    @user = user || User.new      # guest user (not logged in)
    can :manage, :all             # all users have all abilities
  end
end
