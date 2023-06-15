class CreateDailyMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_meals do |t|
      t.references :nutritionist, null: false, foreign_key: { to_table: :users}
      t.references :meal_plan, null: false, foreign_key: true
      t.references :meal_type, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true
      t.datetime :meal_date

      t.timestamps
    end
  end
end
