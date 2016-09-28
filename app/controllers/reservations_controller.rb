class ReservationsController < ApplicationController

	def index
	end

	def new
		@reservation = Reservation.new
		@listing = Listing.find(params[:listing_id])
	end

	def show
		@reservation = Reservation.find(params[:id])
	end

	def create
		@listing = Listing.find(params[:listing_id])
		@reservation = current_user.reservations.new(reservation_params)
		@host = "nextairbnb@gmail.com"
		booked_dates = @listing.booked_dates

		# booked_dates = @listing.booked_dates
		
		# if @reservation.overlapping_dates(booked_dates).empty? && @reservation.save
			# @reservation.update(listing_id: @listing.id)
		# if @reservation.overlapping_dates.empty? && @reservation.save

			# ReservationMailer.reservation_email(@reservation.listing.user, @reservation.user, @reservation.id).deliver_now
			# ReservationJob.perform_later(current_user.email, @user, @reservation.listing.id, @reservation.id)
			# call out reservation job to perform the mail sending task after @reservation is successfully saved
		if @reservation.overlapping_dates(booked_dates).empty? && @reservation.save
			@reservation.update(listing_id: @listing.id)
			if @reservation.save 
				ReservationJob.perform_now(current_user.email, @host, @reservation.listing.id, @reservation.id)
				redirect_to new_payment_path(reservation_id: @reservation.id)
			end
			# 	respond_to do |format|
			# 		format.html { redirect_to(root_path, notice: "Successfully reserved!") }
			# 	end
			# end
		else
			flash[:notice] = "date are not available on #{@reservation.overlapping_dates(booked_dates).join(", ")}"
			render "new"
		end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to listings_path
	end

	private

	def reservation_params
		params.require(:reservation).permit(:startdate, :enddate, :headcount)
	end

	
end
