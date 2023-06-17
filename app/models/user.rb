class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         jwt_revocation_strategy: JwtDenylist
  
  has_one :nutritionist, dependent: :destroy
  has_one :client, dependent: :destroy
  
  validates :name, :role, presence: true
end
