class Subreddit < ActiveRecord::Base
  has_many :posts
  validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 20}
  validates :description, length: {maximum: 500}
end
