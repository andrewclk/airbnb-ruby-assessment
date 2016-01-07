class CreateBookings < ActiveRecord::Migration
	def change
		create_table :bookings do |z|
			z.references :user, index: true 
			z.references :property, index: true
			z.string :booking_date, :booking_info
			z.boolean :status
			z.timestamps null: false
		end
	end
end
