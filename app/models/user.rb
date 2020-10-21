class User < ApplicationRecord
    has_many :tweets
    has_many :likes
    has_many :like_tweets, through: :likes, source: :tweet    
    
    validates :uid, presence: true, uniqueness: :true
    validates :pass, presence: true    
    
    def self.authenticate(uid, pass)
        user = find_by(uid: uid)
        if user and BCrypt::Password.new(user.pass) == pass
            true
        else
            false
        end
    end
end
