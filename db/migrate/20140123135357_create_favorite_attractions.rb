class CreateFavoriteAttractions < ActiveRecord::Migration
  def change
    create_table :favorite_attractions do |t|
      t.integer :attraction_id
      t.integer :user_id

      t.timestamps
    end
  end
end
