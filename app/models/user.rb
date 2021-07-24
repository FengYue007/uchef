class User < ApplicationRecord
  validates :email, presence: true, 
                    uniqueness: true,
                    format: { with: /.+\@.+\..+/ }
  validates :password, presence: true,
                       confirmation: true
end
