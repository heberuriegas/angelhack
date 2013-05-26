class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
            can :edit, Report
            can :delete, Report
        else
            can :index, Report
    end
  end
end
