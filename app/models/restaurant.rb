class Restaurant < ApplicationRecord
  validates :title, presence: true

  default_scope { available }
  scope :available, -> { where(deleted_at: nil) }

  # Restaurant.deleted
  def self.deleted
    unscope(:where).where.not(deleted_at:nil)
  end

  # 使用者方法
  def destroy
    update(deleted_at: Time.now)
  end

  # 管理員方法
  def really_destroy!
    super.destroy
  end
end
