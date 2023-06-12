require 'rails_helper'

RSpec.describe "ActiveAppointments", type: :request do
  before(:all) {
    @nutritionist = FactoryBot.create(:nutritionist, password: 'password')
    @client = FactoryBot.create(:client, password: 'password')
    post client_session_path, params: { client: { email: @client.email, password: 'password' } }
  }
  
  describe "GET /index" do
    it "returns all active appointments" do
      post nutritionist_session_path, params: { nutritionist: { email: @nutritionist.email, password: 'password' } }
      get nutritionist_active_appointments_path(@nutritionist)
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "POST /create" do
    it "returns http success" do
      post client_active_appointments_path(@client), params: { active_appointment: { nutritionist_id: @nutritionist.id}}
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET /show" do
    it "returns http success" do
      active_appointment = FactoryBot.create(:active_appointment, client: @client, nutritionist: @nutritionist)
      get client_active_appointment_path(@client, active_appointment), params: { active_appointment: { nutritionist_id: @nutritionist.id}}
      expect(response).to have_http_status(:success)
    end
  end

  describe "DELETE /destroy" do
    it "removes appointment created" do
      active_appointment = FactoryBot.create(:active_appointment, client: @client, nutritionist: @nutritionist)
      delete client_active_appointment_path(@client, active_appointment)
      expect(response).to have_http_status(:success)
    end
  end

end
