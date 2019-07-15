require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        }, {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        }, {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        }, {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        }, {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name:"Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }, {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, 
      ]
    }
  }
end





def num_points_scored(name)
 response = nil
  game_hash.keys.each do |home_or_away|
    game_hash[home_or_away][:players].length.times do |index| 
      if game_hash[home_or_away][:players][index][:player_name] == name
           response = game_hash[home_or_away][:players][index][:points]
      else
          response = response
      end
    end
  end
  response
end


def shoe_size(name)
  response = nil
  game_hash.keys.each do |home_or_away|
    game_hash[home_or_away][:players].length.times do |index| 
      if game_hash[home_or_away][:players][index][:player_name] == name
           response = game_hash[home_or_away][:players][index][:shoe]
      else
          response = response
      end
    end
  end
  response
end



def team_colors(given_name)
  response = "team name incorrect"
  game_hash.keys.each do |home_or_away|
    if given_name == game_hash[home_or_away][:team_name]
      response = game_hash[home_or_away][:colors]
    end
    response
  end
  response
end


def team_names
  response = []
  game_hash.keys.each do |home_or_away|
    response << game_hash[home_or_away][:team_name]
  end
  response
end




def player_numbers(team)
numbers_array =[]
game_hash.keys.each do |home_or_away|
  if team == game_hash[home_or_away][:team_name]
    game_hash[home_or_away][:players].each do |n|
      numbers_array << n[:number]
    end
   end
  end
  numbers_array
end



def player_stats(name)
  response = "player name not found"
  game_hash.keys.each do |home_or_away|
    game_hash[home_or_away][:players].each do |n|
      if name == n[:player_name]
         n.delete(:player_name)
         response = n
    else
      response = response
      end
    end
  end
  response
end
  
  
  

def big_shoe_rebounds
  big_shoes = 0
  player_with_big_shoes = "unknown"
  
  game_hash.keys.each do |home_or_away|
    game_hash[home_or_away][:players].each do |player|
      if player[:shoe] > big_shoes
      big_shoes = player[:shoe]
      player_with_big_shoes = player[:player_name]
      
      else
        big_shoes = big_shoes
      end
    end
    
  end
  player_stats(player_with_big_shoes)[:rebounds]
end

    
  









