class User < ApplicationRecord
  validates :email, presence: true, 
                    uniqueness: true,
                    format: { with: /.+\@.+\..+/ }
  validates :password, presence: true,
                       confirmation: true

  before_create :encrypt_password

  def self.login(params)
    email = params[:email]
    password = params[:password]

    encrypted_password = Digest::SHA1.hexdigest("123#{password}xx")

    find_by(email: email, password: encrypted_password)
  end

  private
  def encrypt_password
    # 加密
    require 'digest'
    self.password = Digest::SHA1.hexdigest(salted_pwd) 
    # self.password = Digest::SHA1.hexdigest(password)
    # self.password = (Digest::SHA1.hexdigest(password))
    # password = Digest::SHA1.hexdigest(password)
  end

  def salted_pwd(pd)
    "123#{self.password}123"
  end

end
