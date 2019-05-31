class CommentFile < ApplicationRecord
  # DB Relations
  belongs_to :comment

  # Validation
  validates :file, presence: true
end
