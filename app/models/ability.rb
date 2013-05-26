class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.business?
      can :manage, Venue, user_id: user.id
      can :manage, ContactType
      can :manage, Comment
    else
      can :manage, Venue, user_id: user.id
      can :manage, Report, user_id: user.id
      can :manage, Vote, user_id: user.id
      can :read, Report
      can :read, Category
    end
  end
end
