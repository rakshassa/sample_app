class User < ActiveRecord::Base

	before_save { self.email = email.downcase }

	validates(:name,  {presence: true, length: { maximum: 50 } } )
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  	validates :email, presence: true, 
  				format:     { with: VALID_EMAIL_REGEX }, 
  				uniqueness: { case_sensitive: false }
	
	has_secure_password
	validates :password, length: { minimum: 6 }

      				

	# can also be written as 
	# validates :name, presence: true
	# because parens for a func are optional, and a final param of type hash can optionally use curly braces

end
