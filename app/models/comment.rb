class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates_presence_of :comment 
  validates_length_of :comment, :within => 2..300
  validates_presence_of :user_id


  def self.my_comments(x)
     @thispost_comment =  Comment.where(post_id: x)    
  end
end
