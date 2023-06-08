# frozen_string_literal: true

class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.references :nutritionist, null: false, foreign_key: true
      t.string :title
      t.string :picture
      t.string :description
      t.string :instructions, array: true

      t.timestamps
    end
  end
end
