class CreateCars < ActiveRecord::Migration[6.0]
  def change
    create_table :cars do |t|
      t.integer       :car,     null: false
      t.references    :train,   foreign_key: true
      t.timestamps
    end
  end
end
