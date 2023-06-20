class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    if user.role == "client"
      can [:read, :update, :destroy], User, id: user.id
      can :read, Recipe, public: true
      can :read, MealPlan, client_id: user.client.id
      can :read, DailyMeal, nutritionist_id: user.client.nutritionist_id
      # can :index, MealPlan, client_id: user.nutritionist.id
    elsif user.role == "nutritionist"
      can [:read, :update, :destroy], User, id: user.id
      can :manage, Ingredient, nutritionist_id: user.nutritionist.id
      can :manage, Recipe, nutritionist_id: user.nutritionist.id
      can %i[read update destroy], MealPlan, nutritionist_id: user.nutritionist.id
      can [:create], MealPlan do |_meal_plan, params|
        user.nutritionist.clients.exists?(id: params[:client_id])
      end
      can :manage, DailyMeal, nutritionist_id: user.nutritionist.id
        
      # can :manage, DailyMeal, nutritionist_id: user.nutritionist.id

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
