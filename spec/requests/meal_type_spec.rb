require 'rails_helper'

RSpec.describe 'MealTypes', type: :request do
  before(:all) do
    system('rails db:seed RAILS_ENV=test')
  end

  describe 'GET /index' do
    it 'returns all meal_types from the database' do
      get meal_types_path
      expect(response.body).to include('Breakfast')
    end
  end
end
