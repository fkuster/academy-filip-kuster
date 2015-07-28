class Post < ActiveRecord::Base
  belongs_to :subreddit
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :upvotes, dependent: :destroy
  validates :title, presence: true
  validates :content, presence: true

  scope :sorted_desc,-> {order('updated_at DESC')}
end
