class MealTypesController < ApplicationController
  def index
    render json: MealType.all
  end
end
