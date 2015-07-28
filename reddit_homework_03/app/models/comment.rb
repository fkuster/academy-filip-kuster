class Comment < ActiveRecord::Base
  belongs_to :post, counter_cache: true
  belongs_to :user
  validates :content, presence: true

  scope :sorted_desc,-> {order('updated_at DESC')}
end
