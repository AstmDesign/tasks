class Ability
  include CanCan::Ability

  def initialize(user)
    # Define the permissions for the users.
    user ||= User.new # guest user (not logged in)

    if user.admin?
      # Admin can manage everything
      can :manage, :all
    else
      can :manage, Project, user_id: user.id
      can :manage, Task, user_id: user.id
      can :manage, Comment, user_id: user.id
      # can :read, :all, user_id: user.id
    end
  end
end
