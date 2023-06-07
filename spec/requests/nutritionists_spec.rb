require 'rails_helper'

RSpec.describe "Nutritionists", type: :request do
  before(:all) { 
    @nutritionist = Nutritionist.create(name: "Dr. Hamond", email: "test@gmail.com", password: "password")
    post nutritionist_session_path(@nutritionist), params: { nutritionist: { name: "Dr. Hamond", email: "test@gmail.com", password: "password" } }
  }

  describe "GET /show" do
    it "returns the data of the nutritionist" do
      get nutritionist_path(@nutritionist)
      expect(response.body).to include "Hamond"
    end
  end

  describe "PATCH /update" do
    it "updates the record of the signed in nutritionist" do
      patch nutritionist_path(@nutritionist), params: { nutritionist: { name: "Dr. George", email: "test@gmail.com", password: "password" } }
      expect(response.body).to include "successfully"
    end
  end
end
