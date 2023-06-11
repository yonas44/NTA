require 'rails_helper'

RSpec.describe "DailyMeals", type: :request do
  before(:all) {
    @nutritionist = FactoryBot.create(:nutritionist, password: "password")
    @client = FactoryBot.create(:client, password: "password")
    @recipe = FactoryBot.create(:recipe, nutritionist_id: @nutritionist.id)
    @meal_plan = FactoryBot.create(:meal_plan, client_id: @client.id, nutritionist_id: @nutritionist.id)
    @meal_type = FactoryBot.create(:meal_type)
    @daily_meal = FactoryBot.create(:daily_meal, nutritionist_id: @nutritionist.id, recipe_id: @recipe.id, meal_plan_id: @meal_plan.id, meal_type_id: @meal_type.id)
    post nutritionist_session_path, params: { nutritionist: { email: @nutritionist.email, password: "password" } }
  }

  describe "GET /index" do
    it "renders all daily_meals of a specific meal_plan" do
      get nutritionist_meal_plan_daily_meals_path(@nutritionist, @meal_plan)
      expect(response.body).to include(@recipe.title)
    end
  end

  describe "POST /create" do
    it "creates a daily_meal with the specified parameters" do
      post nutritionist_meal_plan_daily_meals_path(@nutritionist, @meal_plan), params: { daily_meal: { recipe_id: @recipe.id, meal_type_id: @meal_type.id, meal_date: Date.today } }
      expect(response.body).to include("Daily_meal created successfully")
    end
  end

  describe "PATCH /update" do
    it "updates a daily_meal with the specified parameters" do
      patch nutritionist_meal_plan_daily_meal_path(@nutritionist, @meal_plan, @daily_meal), params: { daily_meal: { recipe_id: @recipe.id, meal_type_id: @meal_type.id, meal_date: Date.today } }
      expect(response.body).to include("Daily_meal updated successfully")
    end
  end

  describe "DELETE /destroy" do
    it "removes a daily_meal with the specified parameters" do
      delete nutritionist_meal_plan_daily_meal_path(@nutritionist, @meal_plan, @daily_meal)
      expect(response.body).to include("Daily_meal removed successfully")
    end
  end
end
