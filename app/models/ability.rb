class Ability
  include CanCan::Ability

    def initialize( user )
    user ||= User.new

    # Define User abilities
    if user.is? :admin
      can :manage, Expensestatus
      can :manage, Expensetype
      can :manage, Project
      can :manage, Expense
      can :manage, User
    else
      can :read, Expensestatus
      can :read, Expensetype
      can :read, Project
      can :read, Expense
      can :read, User
    end
  end
end
