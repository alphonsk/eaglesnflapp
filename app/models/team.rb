class Team < ApplicationRecord
  has_many :posts, :dependent => :delete_all
  has_one_attached :avatar

  # validate :correct_avatar_type 


  # private 

  # def correct_avatar_type
  #   if avatar.attached? && !avatar.content_type.in?(%w(avatar/jpg avatar/jpeg avatar/png))
  #       errors.add(:avatar, "must be img/png/jpeg/jpg")
  #   elsif avatar.attached? == false
  #       errors.add(:avatar, "add avatar")
  #   end
  # end

end
