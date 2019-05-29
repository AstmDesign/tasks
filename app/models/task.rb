class Task < ApplicationRecord
  # Validation
  validates :title, :deadline, presence: true
end
