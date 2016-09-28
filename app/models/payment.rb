class Payment < ActiveRecord::Base
	belongs_to :reservation
end
