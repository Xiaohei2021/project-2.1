class User < ActiveRecord::Base
    has_many :getaways
    has_secure_password
end
