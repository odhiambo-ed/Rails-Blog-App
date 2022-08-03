class User < ApplicationRecord
  # Validations
  validates :name, presence: true, allow_blank: false, length: { maximum: 250 }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def self.most_recent_posts
    Post.order(created_at: :desc).limit(3)
  end
end
