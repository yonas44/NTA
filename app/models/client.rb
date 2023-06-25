class Client < ApplicationRecord
  belongs_to :user
  belongs_to :nutritionist, optional: true
end
