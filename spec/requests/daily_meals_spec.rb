require 'rails_helper'

RSpec.describe 'DailyMeals', type: :request do
  before(:all) do
    @user = FactoryBot.create(:user, name: 'Random', role: 'nutritionist', password: 'password')
    nutritionist = FactoryBot.create(:nutritionist, user: @user)
    @user2 = FactoryBot.create(:user, name: 'Random', role: 'client', password: 'password')
    client = FactoryBot.create(:client, user: @user2, nutritionist: @user.nutritionist)
    @recipe = FactoryBot.create(:recipe, nutritionist_id: @user.nutritionist.id)
    @meal_plan = FactoryBot.create(:meal_plan, nutritionist: @user.nutritionist, client: @user2.client)
    @meal_type = FactoryBot.create(:meal_type)
    @daily_meal = FactoryBot.create(:daily_meal, nutritionist_id: @user.nutritionist.id, recipe_id: @recipe.id,
                                                 meal_plan_id: @meal_plan.id, meal_type_id: @meal_type.id)
    post user_session_path, params: { user: { email: @user.email, password: 'password' } }
  end

  describe 'GET /index' do
    it 'renders all daily_meals of a specific meal_plan' do
      get daily_meals_path(@meal_plan)
      expect(response.body).to include(@recipe.title)
    end
  end

  describe 'POST /create' do
    it 'creates a daily_meal with the specified parameters' do
      post daily_meals_path,
           params: { daily_meal: { recipe_id: @recipe.id, meal_type_id: @meal_type.id, meal_date: Date.today } }
      expect(response.body).to include('Daily_meal created successfully')
    end
  end

  describe 'PATCH /update' do
    it 'updates a daily_meal with the specified parameters' do
      patch daily_meal_path(@daily_meal),
            params: { daily_meal: { recipe_id: @recipe.id, meal_type_id: @meal_type.id, meal_date: Date.today } }
      expect(response.body).to include('Daily_meal updated successfully')
    end
  end

  describe 'DELETE /destroy' do
    it 'removes a daily_meal with the specified parameters' do
      delete daily_meal_path(@daily_meal)
      expect(response.body).to include('Daily_meal removed successfully')
    end
  end
end
