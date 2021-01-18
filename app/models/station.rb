class Station < ApplicationRecord
  has_many :trains, through: :train_stations
end
