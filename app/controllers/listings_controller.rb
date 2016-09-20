class ListingsController < ApplicationController
	before_action :set_listing, only: [:show, :update, :edit, :destroy]
	#this means that before executing show, update, edit, destroy method, it finds what is the listing id
	
	def index 
		@listings = Listing.all 
	end 

	def new 
		@listing = Listing.new
	end

	def create
		@listing = current_user.listings.new(listing_params)
		if @listing.save
			#i want to go to my listing show page
			redirect_to listing_path(@listing.id)
		else
			# render "new"
			redirect_to new_listing_path
		end

	end
	
	def show
		
	end

	def search
        @listings = Listing.search(params[:term], fields: ["name", "location", "price", "home_type"], mispellings: {below: 5})
        if @listings.blank?
          redirect_to listings_path, flash:{danger: "no successful search result"}
        else
          render :index
        end
    end

    def destroy
    	@listing.destroy
    	redirect_to listings_path
    end	


	private
	#i define a set_listing method, so that i dont have to find the listing id for (show, update, edit, destroy)
	def set_listing
		@listing = Listing.find(params[:id])
	end

	def listing_params
		params.require(:listing).permit(:name, :location, :home_type, :price, :num_of_people, :user_id)
	end
end
