# frozen_string_literal: true

class CreateMealPlanRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :meal_plan_recipes do |t|
      t.references :meal_plan, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.float :portion_size

      t.timestamps
    end
  end
end
