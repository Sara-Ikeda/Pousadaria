class CreateGroupReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :group_reservations do |t|
      t.string :name
      t.string :start_date
      t.string :end_date
      t.references :inn, null: false, foreign_key: true

      t.timestamps
    end
  end
end
