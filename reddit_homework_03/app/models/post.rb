class Post < ActiveRecord::Base
  belongs_to :subreddit
  has_many :comments
  validates :title, presence: true
  validates :content, presence: true
  validates :subreddit_id, presence: true
end
