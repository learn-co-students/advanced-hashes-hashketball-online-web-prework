require "pry"

# Write your code here!
def game_hash
  game = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }, 
        },
      },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }, 
        },
      },
  }
  
  game
end

def num_points_scored(person)
  game_hash.each do |location, team|
    team.each do |category, players|
      
      if category == :players
        players.each do |player, stats|
          
          if player == person
            return stats[:points]
          end
        end
    end
  end
  end
end



def shoe_size(person)
  game_hash.each do |location, team|
    team.each do |category, players|
      
      if category == :players
        players.each do |player, stats|
          
          if player == person
            return stats[:shoe]
          end
        end
    end
  end
  end
end



def team_colors(team_name_given)
  game_hash.each do |location, team|
      if team[:team_name] == team_name_given
        return team[:colors]
      end
    end
  end
  

def team_names()
  team_array = []
  game_hash.each do |location, team|
    team.each do |category, values|
    if category == :team_name
      team_array << values
    end
  end
end
team_array
end
  
  

def player_numbers(team_name)
  number_array = []
  
   game_hash.each do |location, data|
    data.each do |category, values|
      if values == team_name 
      
      data.each do |category, values|  
      if category == :players
        values.each do |player, stats| 
          
          stats.each do |stat, number|
          if stat == :number
            number_array << number
          end
        end
    end
  end
  end
end
end
end
  number_array.sort
end


def player_stats(person)
    game_hash.each do |location, team|
    team.each do |category, players|
      
      if category == :players
        players.each do |player, stats|
          
          if player == person
            return stats
          end
        end
    end
  end
  end
end



def big_shoe_rebounds
  shoe_array = []
  rebounds_array = []
  
  game_hash.each do |location, data|
    data.each do |category, values|
    
      if category == :players
        values.each do |player, stats| 
          
          stats.each do |stat, number|
          if stat == :shoe 
            shoe_array << number
            
          stats.each do |stat, number|
            if stat == :rebounds
            rebounds_array << number
          end
        end
    end
  end
end
end
end
end
largest_shoe = nil
largest_shoe_index = shoe_array.each do |size|
  if largest_shoe == nil || size > largest_shoe
    largest_shoe = size
  end
  shoe_array.index(largest_shoe)
end
  
rebounds_array[shoe_array.index(largest_shoe)]
end
  


