class User < ApplicationRecord
  validates :email, presence: true, 
                    uniqueness: true,
                    format: { with: /.+\@.+\..+/ }
  validates :password, presence: true,
                       confirmation: true

  before_create :encrypt_password

  private
  def encrypt_password
    # 加密
    require 'digest'
    self.password = Digest::SHA1.hexdigest(salted_pwd) 
    # self.password = Digest::SHA1.hexdigest(password)
    # self.password = (Digest::SHA1.hexdigest(password))
    # password = Digest::SHA1.hexdigest(password)
  end

  def salted_pwd
    "123#{self.password}123"
  end

end
