# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview
	def notification_email_preview
		ReservationMailer.notification_email('nextairbnb@gmail.com', 'nextairbnb@gmail.com', 1, 2)  
		#current_user.email, @host, @reservation.listing.id, @reservation.id
	end
end
