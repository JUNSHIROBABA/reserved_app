class TrainsController < ApplicationController

  def index
  end

  def new
    @train = Train.new
  end

  def create
    binding.pry
    Train.create(train_params)
  end

  private

  def train_params
    params.require(:train).permit(:name, :departure_date, :departure_time)
  end

end
