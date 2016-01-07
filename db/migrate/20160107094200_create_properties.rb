class CreateProperties < ActiveRecord::Migration
	def change
		create_table :properties do |z|
			z.references :user, index: true 
			z.string :name, :info
			z.integer :price
			z.timestamps null: false
		end
	end
end
