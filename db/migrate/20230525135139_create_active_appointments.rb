class CreateActiveAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :active_appointments do |t|
      t.references :client, null: false, foreign_key: true
      t.references :nutritionist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
