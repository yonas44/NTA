require 'rails_helper'

RSpec.describe 'MealTypes', type: :request do
  before(:all) do
    system('rails db:seed RAILS_ENV=test')
    @user = FactoryBot.create(:user, name: 'Random', role: 'nutritionist', password: 'password')
    FactoryBot.create(:nutritionist, user: @user)
    post user_session_path, params: { user: { email: @user.email, password: 'password' } }
  end

  describe 'GET /index' do
    it 'returns all meal_types from the database' do
      get meal_types_path
      expect(response.body).to include('Breakfast')
    end
  end
end
