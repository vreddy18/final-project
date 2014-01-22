class CreateAttractions < ActiveRecord::Migration
  def change
    create_table :attractions do |t|
      t.string :title
      t.text :content
      t.string :address
      t.integer :price
      t.string :tagline
      t.string :link
      t.decimal :latitude
      t.decimal :longitude
      t.text :tags

      t.timestamps
    end
  end
end
