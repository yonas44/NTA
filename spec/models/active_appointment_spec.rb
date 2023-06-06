require 'rails_helper'

RSpec.describe ActiveAppointment do
  let(:client) { create(:client) }
  let(:nutritionist) { create(:nutritionist) }
  let(:active_appointment) { create(:active_appointment, client:, nutritionist:) }

  it 'creates a session between a client and nutritionist' do
    active_appointment
    expect(described_class.count).to be > 0
  end
end
