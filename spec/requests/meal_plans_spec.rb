require 'rails_helper'

RSpec.describe 'MealPlans', type: :request do
  before(:all) do
    nutritionist = Nutritionist.create(name: "yonas", email: "test@gmail.com", password: "password")
    client = FactoryBot.create(:client, name: 'Random')
    # FactoryBot.create(:meal_plan, nutritionist_id: nutritionist.id, client_id: client.id)
  end

  describe 'GET /index' do
    it 'renders all meal_plans related to the current user' do
      # post nutritionist_session_path, params: { nutritionist: }
      get meal_plans_path
      # p response
      expect(response.body).to include('test') 
    end
  end
end
