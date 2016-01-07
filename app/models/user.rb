require 'bcrypt'

class User < ActiveRecord::Base
	before_save :encrypted
	has_many :property
	has_many :comment
	has_many :booking
	attr_accessor :password
	
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	# validates :encrypted_password, :presence => true
 
	def encrypted
    	self.encrypted_password = BCrypt::Password.create(self.password)
  end

end