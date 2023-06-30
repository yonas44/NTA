require 'rails_helper'

RSpec.describe 'Ingredients' do
  before(:all) do
    @user = FactoryBot.create(:user, name: 'Random', role: 'nutritionist', password: 'password')
    nutritionist =  FactoryBot.create(:nutritionist, user: @user)
    @ingredient = FactoryBot.create(:ingredient, name: 'Apple', nutritionist: @user.nutritionist)
    post user_session_path, params: { user: { email: @user.email, password: 'password' } }
  end

  describe 'GET /index' do
    it 'returns all ingredients created by the current user' do
      get ingredients_path(@user)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to be 1
    end
  end

  describe 'GET /show' do
    it 'returns an ingredient object created by the current user' do
      get ingredient_path(@ingredient)
      expect(response.body).to include 'Apple'
    end
  end

  describe 'POST /create' do
    it 'creates an ingredient successfully' do
      post ingredients_path(@user),
           params: { ingredient: { name: 'Orange', picture: 'Picture of orange', nutritionist: @user.id } }
      expect(response.body).to include 'Ingredient created successfully!'
    end
  end

  describe 'PATCH /update' do
    it 'updates an ingredient record created by the current user' do
      patch ingredient_path(@ingredient),
            params: { ingredient: { name: 'Orange', picture: 'A new picture' } }
      expect(response.body).to include 'Ingredient updated successfully!'
    end
  end

  describe 'DELETE /destroy' do
    it 'removes an ingredient record created by the current user' do
      delete ingredient_path(@ingredient)
      expect(response.body).to include 'Ingredient deleted successfully!'
    end
  end
end
