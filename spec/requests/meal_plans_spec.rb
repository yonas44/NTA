require 'rails_helper'

RSpec.describe 'MealPlans', type: :request do
  before(:all) do
    @user = FactoryBot.create(:user, name: 'Random', role: 'nutritionist', password: 'password')
    nutritionist = FactoryBot.create(:nutritionist, user: @user)
    @user2 = FactoryBot.create(:user, name: 'Random', role: 'client', password: 'password')
    client = FactoryBot.create(:client, user: @user2, nutritionist: @user.nutritionist)
    @meal_plan = FactoryBot.create(:meal_plan, nutritionist: @user.nutritionist, client: @user2.client)
  end

  describe 'GET /index' do
    it 'renders all meal_plans related to the current nutritionist' do
      post user_session_path, params: { user: { email: @user.email, password: 'password' } }
      get meal_plans_path(@user)
      expect(response.body).to include(@meal_plan.title)
    end

    it 'renders all meal_plans related to the current client' do
      post user_session_path, params: { user: { email: @user2.email, password: 'password' } }
      get meal_plans_path(@user2)
      expect(response.body).to include(@meal_plan.title)
    end
  end

  describe 'GET /show' do
    it 'renders a single meal_plan of the authenticated nutritionist' do
      post user_session_path, params: { user: { email: @user.email, password: 'password' } }
      get meal_plan_path(@meal_plan)
      expect(response.body).to include(@meal_plan.title)
    end

    it 'renders a single meal_plan of an authenticated client' do
      post user_session_path, params: { user: { email: @user2.email, password: 'password' } }
      get meal_plan_path(@meal_plan)
      expect(response.body).to include(@meal_plan.title)
    end
  end

  describe 'POST /create' do
    it 'creates a meal_plan with valid attributes' do
      post user_session_path, params: { user: { email: @user.email, password: 'password' } }
      post meal_plans_path(@user),
           params: { meal_plan: { title: 'First_MealPlan', nutritionist: @user.nutritionist, client: @user2.client } }
      expect(response.body).to include('Meal_plan created successfully')
    end
  end

  describe 'PATCH /update' do
    it 'updates a specific meal_plan' do
      post user_session_path, params: { user: { email: @user.email, password: 'password' } }
      patch meal_plan_path(@meal_plan),
            params: { meal_plan: { title: 'New_MealPlan', nutritionist: @user.nutritionist, client: @user2.client } }
      expect(response.body).to include('updated successfully')
    end
  end

  describe 'DELETE /destroy' do
    it 'removes a specific meal_plan record for a nutritionist' do
      post user_session_path, params: { user: { email: @user.email, password: 'password' } }
      delete meal_plan_path(@meal_plan)
      expect(response.body).to include('removed successfully')
    end
  end
end
