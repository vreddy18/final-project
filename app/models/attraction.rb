class Attraction < ActiveRecord::Base
	searchable do
		text :title
		text :tag_list
	end
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	acts_as_taggable	
	has_many :favorite_attractions 
	has_many :favorited_by, through: :favorite_attractions, source: :user
end
