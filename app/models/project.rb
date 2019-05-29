class Project < ApplicationRecord
  # Validation
  validates :name, presence: true
end
