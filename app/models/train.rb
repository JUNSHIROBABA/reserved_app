class Train < ApplicationRecord
  has_many :stations, through: :train_stations
end
