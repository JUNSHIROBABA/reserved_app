class CreateTrainStations < ActiveRecord::Migration[6.0]
  def change
    create_table :train_stations do |t|
      t.references  :train,   foreign_key: true
      t.references  :station, foreign_key: true
      t.timestamps
    end
  end
end
