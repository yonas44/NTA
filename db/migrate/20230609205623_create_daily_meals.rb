class CreateDailyMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_meals do |t|
      t.references :meal_plan, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
