# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, Text
      can :read, User
    else
     can :read, Text
    end
  end
end
