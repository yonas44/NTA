class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
  
  has_many :clients, class_name: 'User', foreign_key: 'nutritionist_id'
  belongs_to :nutritionist, class_name: 'User', optional: true
  has_many :meal_plans, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :recipes, dependent: :destroy
  has_many :daily_meals, dependent: :destroy
end
