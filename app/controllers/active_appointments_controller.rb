class ActiveAppointmentsController < ApplicationController
  before_action :authenticate_client!, except: %w[index]
  before_action :authenticate_nutritionist!, only: %w[index]
  before_action :set_active_appointment, only: %w[show destroy]
  load_and_authorize_resource

  def index
    render json: ActiveAppointment.where(nutritionist_id: params[:nutritionist_id])
  end

  def create
    active_appointment = ActiveAppointment.new(active_appointment_params)
    if active_appointment.save
      render json: { message: 'Active_appointment created successfully' }, status: 200
    else
      render json: { message: active_appointment&.errors&.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @active_appointment
  end

  def destroy
    if @active_appointment.destroy
      render json: { message: 'Active_appointment removed successfully' }, status: 200
    else
      render json: { message: 'Failed removing active_appointment' }, status: :unprocessable_entity
    end
  end

  private

  def set_active_appointment
    @active_appointment = ActiveAppointment.find(params[:id])
  end

  def active_appointment_params
    params.require(:active_appointment).permit(:nutritionist_id).merge(client_id: params[:client_id])
  end
end
