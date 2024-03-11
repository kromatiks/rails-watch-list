class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  # has many movies (FAILED - 1)
  has_many :movies, through: :bookmarks

  # name is unique (FAILED - 6)
  # name cannot be blank (FAILED - 7)
  validates :name, uniqueness: true, presence: true
end
