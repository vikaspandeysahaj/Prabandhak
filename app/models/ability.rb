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
      can :manage, Currency
    else
      can :read, Expensestatus
      can :read, Expensetype
      can :read, Project
      can :read, Expense
      can :read, User
      can :read, Currency
    end
  end
end
