class MealTypesController < ApplicationController
  def index
    render json: MealType.all, only: %i[name id]
  end
end
