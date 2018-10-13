class Post < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_many :comments, :dependent => :destroy
  validates_presence_of :post
  validates_length_of :post, :within => 2..300
  validates_presence_of :user_id
end
