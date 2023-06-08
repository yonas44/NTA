require 'rails_helper'

RSpec.describe 'Recipes' do
  before(:all) do
    @nutritionist = FactoryBot.create(:nutritionist)
    @recipe = FactoryBot.create(:recipe, title: 'Pie', picture: 'Picture of Pie', nutritionist: @nutritionist)
  end

  describe 'GET /index' do
    it 'returns all recipes created by the current nutritionist' do
      get nutritionist_recipes_path(@nutritionist)
      parsed_response = JSON.parse(response.body)
      expect(parsed_response.length).to be 1
    end
  end

  describe 'POST /create' do
    it 'creates an recipe successfully' do
      post nutritionist_recipes_path(@nutritionist),
           params: { recipe: { title: 'Salad', picture: 'Picture of salad', description: 'description here',
                               nutritionist_id: @nutritionist.id } }
      expect(response.body).to include 'Recipe created successfully!'
    end
  end

  describe 'GET /show' do
    it 'returns a recipe object created by the current nutritionist' do
      get nutritionist_recipe_path(@nutritionist, @recipe)
      expect(response.body).to include 'Pie'
    end
  end

  describe 'PATCH /update' do
    it 'updates the recipe successfully' do
      patch nutritionist_recipe_path(@nutritionist, @recipe),
            params: { recipe: { title: 'Apple Pie', picture: 'new picture', description: 'new description' } }
      expect(response.body).to include 'Recipe updated successfully!'
    end
  end

  describe 'DELETE /destroy' do
    it 'removes a recipe successfully' do
      delete nutritionist_recipe_path(@nutritionist, @recipe)
      expect(response.body).to include 'Recipe removed successfully!'
    end
  end
end
