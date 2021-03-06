class Article < ActiveRecord::Base
    validates :title, :presence => true
    validates :body, :presence => true
    validates :category, :presence => true # ?
    validates :author, :presence => true # ?
    #belongs_to :user 
    belongs_to :author, :class_name => 'User'
    belongs_to :category
    has_and_belongs_to_many :tags
    has_many :comments
    #has_many :appraisers, :class_name => 'User', :through => :ratings
    has_many :ratings
    attr_accessor :tags_string
    
    default_scope order('articles.created_at, (SELECT SUM(ratings.value) FROM ratings WHERE ratings.article_id = articles.id) DESC')
    
    def total_rating
        return ratings.map{|rating| rating.value}.sum
    end
    
    def rating_by(appraiser)
        rating = ratings.find_by_user_id(appraiser.id)
        return rating ? rating.value : 0
    end
    
    def star(appraiser)
        rating = Rating.find_or_initialize_by_article_id_and_user_id(id, appraiser.id)
        if rating.new_record?
            rating.value = 1
        elsif rating.value < 1
            rating.value += 1
        else
            return false
        end
        rating.save #TODO: handle saving error
        return true
    end

    def cross(appraiser)
        rating = Rating.find_or_initialize_by_article_id_and_user_id(id, appraiser.id)
        if rating.new_record?
            rating.value = -1
        elsif rating.value > -1
            rating.value -= 1
        else
            return false
        end
        rating.save #TODO: handle saving error
        return true
    end

    def tags_string= (value)
        value.split(" ").each{|tag|
            tags << Tag.find_or_create_by_title(tag)
        }
    end
    
    def tags_string
        return tags.map{|tag| tag.title }.join(" ")
    end
    
    def owned_by?(owner)
        return false unless owner.is_a? User
        author == owner
    end
end
