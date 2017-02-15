class Itenary < ApplicationRecord
  belongs_to :user
  has_many :items
  has_many :likes
  has_many :liking_user, through: :likes, source: :user
  validates :title, :presence => true

  def like(user)
  	liking_user << user
  end

  def unlike(user)
  	liking_user.delete(user)
  end

  def like_by?(other_user)
    liking_user.include?(other_user)
  end
end
