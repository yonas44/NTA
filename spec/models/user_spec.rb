require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) {
    @user = FactoryBot.create(:user)
  }

  it "creates a user record" do
    expect(described_class.count).to be > 0
  end

end
