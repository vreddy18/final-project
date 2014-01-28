class CreateAttractionsUsersJoin < ActiveRecord::Migration
  def self.up
    create_table 'attractions_users', :id => false do |t|
    	t.column 'attraction_id', :integer
    	t.column 'user_id', :integer
    end
  end
  def self.down
  	drop_table 'attractions_users'
  end
end
