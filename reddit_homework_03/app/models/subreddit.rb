class Subreddit < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions
  belongs_to :user
  validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 20}

  validates :description,presence:true, length: {maximum: 500}
  scope :sorted_desc,-> {order('updated_at DESC')}



end
