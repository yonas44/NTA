class Recipe < ApplicationRecord
  belongs_to :nutritionist
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_many :daily_meals, dependent: :destroy

  accepts_nested_attributes_for :recipe_ingredients
  mount_uploader :picture, PictureUploader

  before_destroy :remove_picture

  private

  def remove_picture
    picture.remove! if picture.present?
  end
end
