class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :subscriptions, dependent: :destroy
  has_many :subreddits, through: :subscriptions
  has_many :comments
  has_many :upvotes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  enum gender: [:male, :female]
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "150x150>" }, :default_url => ":style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /^image\/(jpg|jpeg|png)$/
  validates :email, presence: true
  before_create do
    self.token = SecureRandom.uuid
  end


end
