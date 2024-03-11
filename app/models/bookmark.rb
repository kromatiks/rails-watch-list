class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  # validates comment must at least be 6 characters
  validates :comment, length: { minimum: 6 }
  # validates must be unique
  # a specific movie can only be bookmarked in one specific list
  validates :movie_id, uniqueness: { scope: :list_id }
end
