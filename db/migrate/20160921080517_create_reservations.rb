class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    	t.date :startdate
    	t.date :enddate
    	t.float :headcount
    	t.integer :user_id
    	t.integer :listing_id
      	t.timestamps null: false
    end
  end
end
