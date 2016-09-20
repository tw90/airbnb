class Listing < ActiveRecord::Base
	belongs_to :user
	validates :name, presence: true
	searchkick match: :word_start, searchable: [:name, :location, :price, :home_type]
end
