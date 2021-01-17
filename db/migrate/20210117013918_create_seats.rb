class CreateSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.string        :seat,        null: false
      t.references    :car,         foreign_key: true           
      t.timestamps
    end
  end
end
