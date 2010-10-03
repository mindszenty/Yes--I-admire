class Comment < ActiveRecord::Base
    validates :user, :presence => true # ?
    validates :article, :presence => true # ?
    validates :body, :presence => true
    belongs_to :user
    belongs_to :article
end
