# frozen_string_literal: true

class CreateMealPlans < ActiveRecord::Migration[7.0]
  def change
    create_table :meal_plans do |t|
      t.string :title
      t.string :description
      t.references :client, null: false, foreign_key: true
      t.references :nutritionist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
