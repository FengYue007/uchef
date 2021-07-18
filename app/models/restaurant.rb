class Restaurant < ApplicationRecord
  # validates( :title, presence: true )
  validates :restaurant, presence: true

  # 現在驗證不夠，客制化驗證器寫法
  ivalidate :aaa

  private
    def aaaa
      .....
    end

end
