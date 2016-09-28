class Reservation < ActiveRecord::Base
	belongs_to :user
	belongs_to :listing
	has_many :payments
	validates :startdate, presence: true
	validates :enddate, presence: true
	validates :headcount, presence: true
	# validate :available_date
	# validate :selected_date

	# def dates
	# 	(startdate..enddate).to_a
	# end

	def dates
		(startdate..enddate).to_a
	end

	def overlapping_dates(booked_dates)
		dates & booked_dates
	end








	# def overlapping_dates(booked_dates)
	# 	dates & booked_dates
	# end


	# private

	# def available_date
	# 	if startdate && enddate
	# 		errors.add(:enddate, message: "after startdate") unless enddate > startdate
	# 		errors.add(:startdate, message: "after today") unless startdate >= Date.today
	# 	end
	# end

	# def selected_date
	# 	if startdate && enddate
	# 		reservations = listing.reservations
	# 		reservations.each do |x|
	# 			if (startdate..enddate).overlaps?(x.startdate..x.enddate)
	# 				errors.add(:date, "overalapping")
	# 				break
	# 			end
	# 		end
	# 	end
	# end
end











