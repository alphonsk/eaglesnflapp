class Team < ApplicationRecord
  has_many :posts, :dependent => :delete_all
end
