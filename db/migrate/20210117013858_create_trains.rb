class CreateTrains < ActiveRecord::Migration[6.0]
  def change
    create_table :trains do |t|
      t.string        :name,            null: false
      t.date          :departure_date,  null: false
      t.time          :departure_time,  null: false
      t.timestamps
    end
  end
end
