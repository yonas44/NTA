class Nutritionist < ApplicationRecord
  belongs_to :user
  has_many :clients, dependent: :nullify
end
