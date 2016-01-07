class CreateComments < ActiveRecord::Migration
	def change
		create_table :comments do |z|
			z.references :user, index: true 
			z.references :property, index: true 
			z.string :comment
			z.timestamps null: false
		end
	end
end
