class ActiveAppointment < ApplicationRecord
  belongs_to :client
  belongs_to :nutritionist

  validates :client, :nutritionist, presence: true
end
