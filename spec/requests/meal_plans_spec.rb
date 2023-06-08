require 'rails_helper'

RSpec.describe 'MealPlans', type: :request do
  before(:all) do
    @nutritionist = Nutritionist.create(name: 'yonas', email: 'test2@gmail.com', password: 'password')
    @client = Client.create(name: 'metron', email: 'test@gmail.com', password: 'password')
    @meal_plan = FactoryBot.create(:meal_plan, nutritionist_id: @nutritionist.id, client_id: @client.id)
  end

  describe 'GET /index' do
    it 'renders all meal_plans related to the current nutritionist' do
      post nutritionist_session_path, params: { nutritionist: { email: 'test2@gmail.com', password: 'password' } }
      get nutritionist_meal_plans_path(@nutritionist)
      expect(response.body).to include(@meal_plan.title)
    end

    it 'renders all meal_plans related to the current client' do
      post client_session_path, params: { client: { email: 'test@gmail.com', password: 'password' } }
      get client_meal_plans_path(@client)
      expect(response.body).to include(@meal_plan.title)
    end
  end

  describe 'GET /show' do
    it 'renders a single meal_plan of the authenticated nutritionist' do
      post nutritionist_session_path, params: { nutritionist: { email: 'test2@gmail.com', password: 'password' } }
      get nutritionist_meal_plan_path(@nutritionist, @meal_plan)
      expect(response.body).to include(@meal_plan.title)
    end

    it 'renders a single meal_plan of an authenticated client' do
      post client_session_path, params: { client: { email: 'test@gmail.com', password: 'password' } }
      get client_meal_plan_path(@client, @meal_plan)
      expect(response.body).to include(@meal_plan.title)
    end
  end

  describe 'POST /create' do
    it 'creates a meal_plan with valid attributes' do
      post nutritionist_session_path, params: { nutritionist: { email: 'test2@gmail.com', password: 'password' } }
      post nutritionist_meal_plans_path(@nutritionist),
           params: { meal_plan: { title: 'First_MealPlan', nutritionist_id: @nutritionist.id, client_id: @client.id,
                                  description: 'text here' } }
      expect(response.body).to include('Meal_plan created successfully')
    end
  end

  describe 'PATCH /update' do
    it 'updates a specific meal_plan' do
      post nutritionist_session_path, params: { nutritionist: { email: 'test2@gmail.com', password: 'password' } }
      patch nutritionist_meal_plan_path(@nutritionist, @meal_plan),
            params: { meal_plan: { title: 'New_MealPlan', nutritionist_id: @nutritionist.id, client_id: @client.id,
                                   description: 'text here' } }
      expect(response.body).to include('updated successfully')
    end
  end

  describe 'DELETE /destroy' do
    it 'removes a specific meal_plan record for a nutritionist' do
      post nutritionist_session_path, params: { nutritionist: { email: 'test2@gmail.com', password: 'password' } }
      delete nutritionist_meal_plan_path(@nutritionist, @meal_plan)
      expect(response.body).to include('removed successfully')
    end
  end
end
