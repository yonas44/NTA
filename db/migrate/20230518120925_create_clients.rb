# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.references :user, null: false, foreign_key: true
      t.references :nutritionist, foreign_key: { to_table: :users}
      t.string :profile_pic
      t.string :health_info
  
      t.timestamps 
    end     
  end
end
