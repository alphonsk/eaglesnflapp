class Post < ApplicationRecord
  belongs_to :user
  belongs_to :team
  has_many :comments, :dependent => :destroy
  validates_presence_of :post
  validates_length_of :post, :within => 2..300
  validates_presence_of :user_id

  # 
  has_one_attached :image
  # validate :correct_image_type

  # private 
  # def correct_image_type
  #       if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
  #           errors.add(:image, "must be img/png")
  #       elsif image.attached? == false
  #           errors.add(:image, "add image")
  #       end
  #   end

end
