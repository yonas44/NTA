# frozen_string_literal: true

class CreateNutritionists < ActiveRecord::Migration[7.0]
  def change
    create_table :nutritionists do |t|
      t.references :user, null: false, foreign_key: true
      t.string :profile_pic
    end
  end
end
