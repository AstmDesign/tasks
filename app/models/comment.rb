class Comment < ApplicationRecord
  belongs_to :task

  # Validation
  validates :comment, presence: true
end
