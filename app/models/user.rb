class User < ActiveRecord::Base
    has_many :getaways
    validates :email, :password, :username, presence: true
    validates :username, uniqueness: true
    has_secure_password

    def self.most_getaways
        User.all.max_by do |u|
            u.getaways.count
        end
    end
end
