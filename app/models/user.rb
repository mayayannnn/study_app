class User < ApplicationRecord
    validates :email, {uniqueness: true}
    validates :name, {uniqueness: true}
    has_secure_password
end
