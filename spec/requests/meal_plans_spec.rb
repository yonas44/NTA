require 'rails_helper'

RSpec.describe 'MealPlans', type: :request do
  before(:all) do
    @nutritionist = Nutritionist.create(name: "yonas", email: "test@gmail.com", password: "password")
    @client = Client.create(name: "metron", email: "test@gmail.com", password: "password")
    @meal_plan = FactoryBot.create(:meal_plan, nutritionist_id: @nutritionist.id, client_id: @client.id)
  end
  
  describe 'GET /index' do
    it 'renders all meal_plans related to the current nutritionist' do
      post nutritionist_session_path, params: { nutritionist: { email: "test@gmail.com", password: "password" } }
      get nutritionist_meal_plans_path(@nutritionist)
      expect(response.body).to include(@meal_plan.title) 
    end
    
    it 'renders all meal_plans related to the current client' do
      post client_session_path, params: { client: { email: "test@gmail.com", password: "password" } }
      get client_meal_plans_path(@client)
      expect(response.body).to include(@meal_plan.title) 
    end
  end
  
  describe "GET /show" do
    it "renders a single meal_plan of the authenticated nutritionist" do
      post nutritionist_session_path, params: { nutritionist: { email: "test@gmail.com", password: "password" } }
      get nutritionist_meal_plan_path(@nutritionist, @meal_plan)
      expect(response.body).to include(@meal_plan.title)
    end

    it 'renders a single meal_plan of an authenticated client' do
      post client_session_path, params: { client: { email: "test@gmail.com", password: "password" } }
      get client_meal_plan_path(@client, @meal_plan)
      expect(response.body).to include(@meal_plan.title) 
    end
  end

end
