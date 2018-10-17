class Team < ApplicationRecord
  require 'csv' 
  require "http"
  require "json" 
  require 'uri' 
  require 'openssl' 
  require 'net/http'
  require 'net/https' 
  require 'active_support/core_ext/hash'

  has_many :posts, :dependent => :delete_all
  has_one_attached :avatar
  has_many :userteams,  :dependent => :destroy 
  has_many :users, through: :userteams, :dependent => :destroy 
  # belongs_to :winslose


  def self.read_file
    aFile = File.new("input.txt", "r")
    if aFile
      content = aFile.sysread(5)
      
    else
      content =  "Unable to open file!"
    end
    puts content

  end


  def self.match_names(x)
   
  end

  
  


   
  # validate :correct_avatar_type 


  # private 

  # def correct_avatar_type
  #   if avatar.attached? && !avatar.content_type.in?(%w(avatar/jpg avatar/jpeg avatar/png))
  #       errors.add(:avatar, "must be img/png/jpeg/jpg")
  #   elsif avatar.attached? == false
  #       errors.add(:avatar, "add avatar")
  #   end
  # end



  
# # fantasy data
def self.get_api
  # uri = URI('https://api.fantasydata.net/v3/nfl/scores/JSON/Schedules/2018')
  uri = URI('https://api.fantasydata.net/v3/nfl/stats/JSON/Standings/2018')

  request = Net::HTTP::Get.new(uri.request_uri)
  # Request headers
  request['Ocp-Apim-Subscription-Key'] = 'API4db9674f94364f849f22'
  # Request body
  request.body = "body"

  response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
  end

# @all_api = response.body
  man = response.body
  nam = JSON.parse(man)
  puts 99999999
#  puts nam
  # nam = [
  #     {"GameKey":"201810126","SeasonType":1,"Season":2018,"Week":1, "StadiumDetails":{"StadiumID":18,"Name":"Lincoln Financial Field","City":"Philadelphia","State":"PA","Type":"Outdoor"}
  # },
  
  # {"GameKey":"201810103","SeasonType":1,"Season":2018,"Week":1, "StadiumDetails":{"StadiumID":7,"Name":"M&T Bank Stadium","City":"Baltimore","State":"MD","Type":"Outdoor"}
      
  # }
  # ] 

   
  # nam = {"SeasonType"=>1, "Season"=>2018, "Conference"=>"AFC", "Division"=>"East", "Team"=>"MIA", "Name"=>"Miami Dolphins", "Wins"=>3, "Losses"=>2, "Ties"=>0, "Percentage"=>0.7, "PointsFor"=>111, "PointsAgainst"=>131, "NetPoints"=>-18, "Touchdowns"=>14, "DivisionWins"=>1, "DivisionLosses"=>1, "ConferenceWins"=>3, "ConferenceLosses"=>2, "TeamID"=>19, "DivisionTies"=>0, "ConferenceTies"=>0}
  # {"SeasonType"=>1, "Season"=>2018, "Conference"=>"AFC", "Division"=>"East", "Team"=>"NE", "Name"=>"New England Patriots", "Wins"=>3, "Losses"=>2, "Ties"=>0, "Percentage"=>0.7, "PointsFor"=>149, "PointsAgainst"=>121, "NetPoints"=>25, "Touchdowns"=>18, "DivisionWins"=>1, "DivisionLosses"=>0, "ConferenceWins"=>3, "ConferenceLosses"=>1, "TeamID"=>21, "DivisionTies"=>0, "ConferenceTies"=>0}
  # {"SeasonType"=>1, "Season"=>2018, "Conference"=>"AFC", "Division"=>"East", "Team"=>"NYJ", "Name"=>"New York Jets", "Wins"=>2, "Losses"=>3, "Ties"=>0, "Percentage"=>0.5, "PointsFor"=>138, "PointsAgainst"=>118, "NetPoints"=>18, "Touchdowns"=>15, "DivisionWins"=>0, "DivisionLosses"=>1, "ConferenceWins"=>1, "ConferenceLosses"=>3, "TeamID"=>24, "DivisionTies"=>0, "ConferenceTies"=>0}
  # {"SeasonType"=>1, "Season"=>2018, "Conference"=>"AFC", "Division"=>"East", "Team"=>"BUF", "Name"=>"Buffalo Bills", "Wins"=>2, "Losses"=>3, "Ties"=>0, "Percentage"=>0.5, "PointsFor"=>71, "PointsAgainst"=>132, "NetPoints"=>-55, "Touchdowns"=>6, "DivisionWins"=>0, "DivisionLosses"=>0, "ConferenceWins"=>1, "ConferenceLosses"=>2, "TeamID"=>4, "DivisionTies"=>0, "ConferenceTies"=>0}
  # {"SeasonType"=>1, "Season"=>2018, "Conference"=>"AFC", "Division"=>"North", "Team"=>"CIN", "Name"=>"Cincinnati Bengals", "Wins"=>4, "Losses"=>1, "Ties"=>0, "Percentage"=>0.9, "PointsFor"=>172, "PointsAgainst"=>146, "NetPoints"=>23, "Touchdowns"=>21, "DivisionWins"=>1, "DivisionLosses"=>0, "ConferenceWins"=>3, "ConferenceLosses"=>0, "TeamID"=>7, "DivisionTies"=>0, "ConferenceTies"=>0}

end
   
 

 

  

  
  

end


 
