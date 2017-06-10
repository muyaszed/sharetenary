class Itenary < ApplicationRecord
  belongs_to :user
  has_many :items
  has_many :likes
  has_many :liking_users, through: :likes, source: :user
  has_many :bookmarks
  has_many :bookmarked, through: :bookmarks, source: :user
  validates :title, :presence => true

  def like(user)
  	liking_users << user
  end

  def unlike(user)
  	liking_users.delete(user)
  end

  def like_by?(other_user)
    liking_users.include?(other_user)
  end

  def bookmark(user)
    bookmarked << user
  end

  def unbookmark(user)
    bookmarked.delete(user)
  end

  def bookmarked_by?(other_user)
    bookmarked.include?(other_user)
  end
end
