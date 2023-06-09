require 'rails_helper'

RSpec.describe "Clients", type: :request do
  before(:all) {
    @client = FactoryBot.create(:client, password: "password")
    post client_session_path, params: { client: { email: @client.email, password: "password" } }
  }

  describe "GET /show" do
    it 'returns the client profile for the authenticated client' do
      get client_path(@client)
      expect(response.body).to include(@client.name)
    end
  end

  describe "PATCH /update" do
    it 'updates the record of the signed in client' do
      patch client_path(@client),
            params: { client: { name: 'Mr. George', email: 'test@gmail.com', password: 'password' } }
      expect(response.body).to include 'successfully'
    end
  end
end
