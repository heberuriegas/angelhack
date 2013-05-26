class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.business?
      can :manage, Venue
      can :manage, Type
      can :manage, Contact
      #can :manage, Comment
    else
      can :read, Venue
      can :read, Report
      can :read, Category
    end
  end
end
