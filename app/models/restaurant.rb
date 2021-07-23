class Restaurant < ApplicationRecord
  validates :title, presence: true

  default_scope { available }
  scope :available, -> { where(deleted_at: nil).order(id: :desc) }

  # Restaurant.deleted
  def self.deleted
    unscope(:where).where.not(deleted_at:nil)
  end

  def destroy
    update(deleted_at: Time.now)
  end
end
