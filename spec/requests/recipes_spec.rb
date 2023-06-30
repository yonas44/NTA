require 'rails_helper'

RSpec.describe 'Recipes' do
  before(:all) do
    @user = FactoryBot.create(:user, name: 'Random', role: 'nutritionist', password: 'password')
    nutritionist =  FactoryBot.create(:nutritionist, user: @user)
    @recipe = FactoryBot.create(:recipe, title: 'Pie', picture: 'Picture of Pie', nutritionist: )
    post user_session_path, params: { user: { email: @user.email, password: 'password' } }
  end

  describe 'GET /index' do
    it 'returns all recipes created by the current nutritionist' do
      get recipes_path(@user)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to be 1
    end
  end

  describe 'POST /create' do
    it 'creates an recipe successfully' do
      post recipes_path(@user),
           params: { recipe: { title: 'Salad', picture: 'Picture of salad', description: 'description here',
                               nutritionist: @user.nutritionist } }
      expect(response.body).to include 'Recipe created successfully!'
    end
  end

  describe 'GET /show' do
    it 'returns a recipe object created by the current nutritionist' do
      get recipe_path(@recipe)
      expect(response.body).to include 'Pie'
    end
  end

  describe 'PATCH /update' do
    it 'updates the recipe successfully' do
      patch recipe_path(@recipe),
            params: { recipe: { title: 'Apple Pie', picture: 'new picture', description: 'new description' } }
      expect(response.body).to include 'Recipe updated successfully!'
    end
  end

  describe 'DELETE /destroy' do
    it 'removes a recipe successfully' do
      delete recipe_path(@recipe)
      expect(response.body).to include 'Recipe removed successfully!'
    end
  end
end
