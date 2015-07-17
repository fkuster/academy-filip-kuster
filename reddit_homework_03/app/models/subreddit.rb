class Subreddit < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions
  validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 20}

  validates :description, length: {maximum: 500}
  scope :sorted_desc,-> {order('updated_at DESC')}



end
