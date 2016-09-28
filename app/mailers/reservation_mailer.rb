class ReservationMailer < ApplicationMailer
	default from: 'nextairbnb@gmail.com'
 
  def notification_email(customer, host, listing_id, reservation_id)
    @host = host
    @customer = customer
    @listing = Listing.find(listing_id)
    # @url  = 'localhost:3000/listings'
    mail(to: @host, subject: "You have received a booking from #{@customer}")
  end
end
