class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user
    if user.role? :admin
      can :manage, :all
    end
  end

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
end
