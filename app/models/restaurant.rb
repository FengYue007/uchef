class Restaurant < ApplicationRecord
  act_as_paranoid
  validates :title, presence: true
  
end
