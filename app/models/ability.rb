class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    if user.is_a?(Client)
      can :manage, ActiveAppointment, client_id: user.id
      can :read, MealPlan, client_id: user.id
      # can :index, MealPlan, client_id: user.id
    elsif user.is_a?(Nutritionist)
      can :index, ActiveAppointment, nutritionist_id: user.id
      can [:index, :update, :destroy], MealPlan, :nutritionist_id == user.id
      can [:create], MealPlan do |meal_plan, params|
        return false unless :nutritionist_id != user.id
        user.active_appointments.exists?(client_id: params[:client_id])
      end
      # can [:create, :update, :destroy], MealPlan, :client_id => user.active_appointments
    end
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
