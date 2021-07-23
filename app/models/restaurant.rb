class Restaurant < ApplicationRecord
  validates :title, presence: true

  scope :available, -> { where(deleted_at: nil) }
  default_scope { where(deleted_at: nil) }

  def destroy
    update(deleted_at: Time.now)
  end
end
