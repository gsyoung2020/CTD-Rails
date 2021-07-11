class Comment < ApplicationRecord
    paginates_per 15
    
    belongs_to :user
    belongs_to :post
end
