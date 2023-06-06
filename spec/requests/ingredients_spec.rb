require 'rails_helper'

RSpec.describe 'Ingredients' do
  before(:all) do
    @nutritionist = create(:nutritionist)
    @ingredient = create(:ingredient, name: 'Apple', nutritionist: @nutritionist)
  end

  describe 'GET /index' do
    it 'returns all ingredients created by the current user' do
      get nutritionist_ingredients_path(@nutritionist)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to be 1
    end
  end

  describe 'GET /show' do
    it 'returns an ingredient object created by the current user' do
      get nutritionist_ingredient_path(@nutritionist, @ingredient)
      expect(response.body).to include 'Apple'
    end
  end

  describe 'POST /create' do
    it 'creates an ingredient successfully' do
      post nutritionist_ingredients_path(@nutritionist),
           params: { ingredient: { name: 'Orange', picture: 'Picture of orange', nutritionist: @nutritionist.id } }
      expect(response.body).to include 'Ingredient created successfully!'
    end
  end

  describe 'PATCH /update' do
    it 'updates an ingredient record created by the current user' do
      patch nutritionist_ingredient_path(@nutritionist, @ingredient),
            params: { ingredient: { name: 'Orange', picture: 'A new picture' } }
      expect(response.body).to include 'Ingredient updated successfully!'
    end
  end

  describe 'DELETE /destroy' do
    it 'removes an ingredient record created by the current user' do
      delete nutritionist_ingredient_path(@nutritionist, @ingredient)
      expect(response.body).to include 'Ingredient deleted successfully!'
    end
  end
end
