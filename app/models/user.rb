class User < ApplicationRecord
    paginates_per 15
    has_secure_password
    has_many :comments, dependent: :destroy
    has_many :posts, dependent: :destroy

    has_many :assignment
    has_many :roles, through: :assignment

    def role?(role)  
        roles.any? { |r| r.name.underscore.to_sym == role }  
        end  
end
