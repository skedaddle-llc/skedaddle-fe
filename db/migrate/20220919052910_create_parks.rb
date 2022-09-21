# frozen_string_literal: true

class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.string :description
      t.string :directions
      t.string :lat
      t.string :lon
      t.string :activities
      t.string :url
      t.string :thumbnail
    end
  end
end
