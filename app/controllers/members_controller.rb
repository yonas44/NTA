class MembersController < ApplicationController
  before_action :authenticate_nutritionist!

  def show
    render json: { message: "If you see this, you're in!" }
  end
end
