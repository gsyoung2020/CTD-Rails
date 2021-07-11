class Post < ApplicationRecord
    paginates_per 15
    belongs_to :category
    has_many :comments
    belongs_to :user

    has_many :post_hash_tags
    has_many :hash_tags, through: :post_hash_tags

    after_commit :create_hash_tags, on: :create
  
        def create_hash_tags
        # create hash_tags of Post
        extract_name_hash_tags.each do |name|
            hash_tags.create(name: name)
        end
    end

    def extract_name_hash_tags
        tag.to_s.scan(/#\w+/).map{|name| name.gsub("#", "")}
    end

end
