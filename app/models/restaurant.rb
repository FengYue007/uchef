class Restaurant < ApplicationRecord
  # validates( :title, presence: true )
  validates :restaurant, presence: true

  validates :restaurant, :title, :email, presence: true
  # validates :restaurant, :email, presence: true
  
  # 建議寫兩行！
  validates :restaurant, :title, presence: true
  validates :restaurant, :email, presence: true, uniqueness: true
end
