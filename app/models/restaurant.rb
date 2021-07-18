class Restaurant < ApplicationRecord
  # validates( :title, presence: true )
  validates :restaurant, presence: true

  # Rails 3 驗證寫法
  validate_presence_of :title
end
