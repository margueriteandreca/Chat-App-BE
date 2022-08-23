class User < ApplicationRecord
    require "securerandom"

    has_one_attached :avatar 

    has_many :messages
    has_many :conversations, through: :messages
    
    validates :username, presence: true, uniqueness: true 
    validates :username, uniqueness: { case_sensitive: false }
    validates :password, presence: true
    #use redux to ensure password is alphanumeric 

    has_secure_password 
    # we are using bcrypt, and this user has a secure password
end
