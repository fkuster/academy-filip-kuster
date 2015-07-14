class Post < ActiveRecord::Base
  belongs_to :subreddit
  belongs_to :user
  has_many :comments
  has_many :upvotes
  validates :title, presence: true
  validates :content, presence: true
  validates :subreddit_id, presence: true
  scope :sorted_desc,-> {order('updated_at DESC')}
end
