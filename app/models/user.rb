class User < ApplicationRecord
    has_secure_password
    has_many :comments
    has_many :posts

    has_many :assignment
    has_many :roles, through: :assignment

    def role?(role)  
        roles.any? { |r| r.name.underscore.to_sym == role }  
        end  
end
