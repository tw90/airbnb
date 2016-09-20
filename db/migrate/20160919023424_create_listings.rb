class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
    	t.string :name
    	t.string :location
    	t.integer :price
    	t.integer :num_of_people
    	t.string :home_type
    	t.integer :user_id
    	t.timestamps null: false
    end
  end
end
