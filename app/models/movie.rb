class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :restrict_with_error
  before_destroy :check_bookmarks

  validates :title, uniqueness: true, presence: true
  validates :overview, presence: true


  private

   # should not be able to destroy self if has bookmarks children (FAILED - 1)
  def check_bookmarks
    if bookmarks.any?
      errors.add(:base, "Movie can not be destroyed because it has bookmarks")
      throw(:abort)
    end
  end
end
