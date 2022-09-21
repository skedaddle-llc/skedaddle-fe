# frozen_string_literal: true

class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.string :search
      t.timestamps
    end
  end
end
