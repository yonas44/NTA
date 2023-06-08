require 'rails_helper'

RSpec.describe ActiveAppointment do
  let(:client) { FactoryBot.create(:client) }
  let(:nutritionist) { FactoryBot.create(:nutritionist) }
  let(:active_appointment) { FactoryBot.create(:active_appointment, client:, nutritionist:) }

  it 'creates a session between a client and nutritionist' do
    active_appointment
    expect(described_class.count).to be > 0
  end
end
