class Comment < ActiveRecord::Base
  belongs_to :post, counter_cache: true
  belongs_to :user
  validates :content, presence: true
  validates :post_id, presence: true
  scope :sorted_desc,-> {order('updated_at DESC')}
end
