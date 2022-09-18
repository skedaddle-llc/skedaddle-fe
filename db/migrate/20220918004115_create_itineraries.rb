class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.string :search
      t.json :parks
      t.json :restaurants

      t.timestamps
    end
  end
end
