class User < ApplicationRecord
    has_secure_password
    belongs_to :employee
    
    validates_presence_of :email  
    validates_uniqueness_of :email, allow_blank: true  
    validates_presence_of :password_digest, on: :create   
    validates_confirmation_of :password_digest, message: "does not match" 
    validates_length_of :password_digest, minimum: 4, message: " 4 characters at  least", allow_blank: true
    
    
    def self.authenticate(email,password)
        find_by_email(email).try(:authenticate, password)
    end
end
