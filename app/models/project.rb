class Project < ApplicationRecord
  # DB Relations
  has_many :tasks, dependent: :destroy
  belongs_to :user

  # Validation
  validates :name, :status, presence: true

  # Enum
  enum status: %i[pending in_progress finished]
end
