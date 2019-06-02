class Task < ApplicationRecord
  # DB Relations
  has_many :comments, dependent: :destroy
  belongs_to :user
  belongs_to :project

  # Validation
  validates :title, :status, :deadline, presence: true

  # Enum
  enum status: %i[pending in_progress finished]
  enum priority: %i[high normal low]
end
