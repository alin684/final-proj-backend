class User < ApplicationRecord
  has_secure_password
  has_friendship

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :posted_posts, class_name: "Post", foreign_key: "poster_id"
  has_many :received_posts, class_name: "Post", foreign_key: "receiver_id"
end
