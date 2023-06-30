require 'rails_helper'

RSpec.describe 'Users', type: :request do
  before(:all) do
    @user = FactoryBot.create(:user, name: 'Hamond', role: 'nutritionist', password: 'password')
    FactoryBot.create(:nutritionist, user: @user)
    post user_session_path,
         params: { user: { email: @user.email, password: 'password' } }
  end

  describe 'GET /show' do
    it 'returns the data of the user' do
      get user_path(@user)
      expect(response.body).to include 'Hamond'
    end
  end

  describe 'PATCH /update' do
    it 'updates the record of the signed in user' do
      patch user_path(@user),
            params: { user: {
              name: 'Selam Tesfu',
              email: 'selam@gmail.com',
              password: 'password',
              role: 'client',
              client: {
                profile_pic: 'selam picture here',
                nutritionist_id: 1
              }
            } }
      expect(response.body).to include 'successfully'
    end
  end
end
