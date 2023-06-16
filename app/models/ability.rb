class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    if user.role == "client"
      can [:read, :update, :destroy], User, id: user.id
      can :read, Recipe, public: true
      # can :read, MealPlan, client_id: user.id
      # can :index, MealPlan, client_id: user.id
    elsif user.role == "nutritionist"
      can [:read, :update, :destroy], User, id: user.id
      can :manage, Ingredient, nutritionist_id: user.id
      can :manage, Recipe, nutritionist_id: user.id
      # can %i[index update destroy], MealPlan, nutritionist_id: user.id
      # can [:create], MealPlan do |_meal_plan, params|
      #   return false unless user.id != :nutritionist_id

      #   user.active_appointments.exists?(client_id: params[:client_id])
      # end
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
