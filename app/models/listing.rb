class Listing < ActiveRecord::Base
	mount_uploaders :avatars, AvatarUploader
	belongs_to :user
	has_many :reservations
	validates :name, presence: true
	searchkick match: :word_start, searchable: [:name, :location, :price, :home_type]

	def booked_dates
		dates_tht_are_booked = []
		self.reservations.each do |reservation|
			reservation.dates.each do |date|
				dates_tht_are_booked <<date
			end
		end
		return dates_tht_are_booked

	end






	# def booked_dates
	# 	dates_tht_are_booked = []
	# 	self.reservations.each do |reservation|
	# 		reservation.dates.each do |date|
	# 			dates_tht_are_booked << date
	# 		end

	# 	end
	# 	dates_tht_are_booked
	# end

end
