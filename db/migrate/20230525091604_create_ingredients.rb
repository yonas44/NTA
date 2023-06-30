# frozen_string_literal: true

class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :category
      t.references :nutritionist, null: false, foreign_key: true
      t.string :macro_nutrients
      t.string :picture

      t.timestamps
    end
  end
end
