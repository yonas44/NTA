class Ingredient < ApplicationRecord
  belongs_to :nutritionist
  has_many :recipe_ingredients, dependent: :destroy
  has_many :recipes, through: :recipe_ingredients
  validates :name, presence: true
  mount_uploader :picture, PictureUploader

  before_destroy :remove_picture

  private

  def remove_picture
    picture.remove! if picture.present?
  end
end
