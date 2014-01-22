class AddAvatarColumnsToAttractions < ActiveRecord::Migration
  def self.up
    add_attachment :attractions, :avatar
  end

  def self.down
    remove_attachment :attractions, :avatar
  end
end
