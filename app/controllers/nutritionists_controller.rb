class NutritionistsController < ApplicationController
  before_action :authenticate_nutritionist!, only: [:update]

  def show
    render json: Nutritionist.find(params[:id])
  end

  def update
    return render json: { message: 'Not a valid nutritionist' } unless current_nutritionist.id == params[:id].to_i

    if current_nutritionist.update(nutritionist_params)
      render json: { message: 'Nutritionist info update successfully' }, status: 200
    else
      render json: { message: 'Updating nutritionist info failed' }, status: :unprocessable_entity
    end
  end

  private

  def nutritionist_params
    params.require(:nutritionist).permit(:name, :email, :password)
  end
end
