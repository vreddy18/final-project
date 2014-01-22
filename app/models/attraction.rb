class Attraction < ActiveRecord::Base
	acts_as_indexed :fields => [:title, :tags]
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	has_many :favorites
	has_many :users, through: :favorites
end
