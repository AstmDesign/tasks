class CommentFile < ApplicationRecord
  belongs_to :comment

  # Validation
  validates :file, presence: true
end
