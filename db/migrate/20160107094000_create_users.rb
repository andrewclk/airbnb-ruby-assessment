class CreateUsers < ActiveRecord::Migration
	def change
		create_table :users do |u|
			u.string :name, :email, :encrypted_password
			u.timestamps null: false
		end
	end
end
