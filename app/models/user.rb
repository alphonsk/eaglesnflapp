class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :userteams 
  has_many :comments 
  has_many :teams, through: :userteams   
  
  
  def self.post_user_name(x)
    @post_user_name = User.find(x).email 
    @gud =  email_user_name(@post_user_name)
     
end

def self.email_user_name(x) 
   @email_user = x.split("@").first
    @email_user
end
end
