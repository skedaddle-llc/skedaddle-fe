class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :rating
      t.string :price
      t.string :image_url
      t.string :url
      t.string :categories
      t.string :address
      t.string :phone
    end
  end
end
