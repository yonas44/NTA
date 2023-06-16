class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
  
  has_one :nutritionist, dependent: :destroy
  has_one :client, dependent: :destroy
  has_many :meal_plans, foreign_key: 'nutritionist_id', dependent: :destroy
  has_many :ingredients, dependent: :destroy, foreign_key: 'nutritionist_id'
  has_many :recipes, dependent: :destroy, foreign_key: 'nutritionist_id'
  has_many :daily_meals, dependent: :destroy, foreign_key: 'nutritionist_id'

  validates :name, :role, presence: true
end
