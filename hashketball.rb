# Write your code here!

require "pry"

def game_hash 
  {
    :home =>{
      :team_name =>"Brooklyn Nets",
      :colors =>["Black", "White"],
      :players =>{
        "Alan Anderson" =>{ 
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
          },
        "Reggie Evans" =>{
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
          },
        "Brook Lopez" =>{
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
          },
        "Mason Plumlee" =>{
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
          },
        "Jason Terry" =>{
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away =>{
      :team_name =>"Charlotte Hornets",
      :colors =>["Turquoise", "Purple"],
      :players =>{
        "Jeff Adrien" =>{
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        }, 
        "Bismak Biyombo" =>{
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" =>{
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" =>{
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" =>{
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end 

def num_points_scored (player_name)
  
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, stats|
      if player_name == player 
        return stats[:points]
      end
    end 
  end
  
end

def shoe_size(player_name)
  
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, stats|
      if player_name == player 
        return stats[:shoe]
      end 
    end
  end
end

def team_colors(team)
  
  game_hash.each do |each_team, team_data|
    if team_data[:team_name] == team 
      return team_data[:colors]
    end
  end
end


def team_names
  game_hash.collect do |team, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team_name)
  home_numbers = []
  away_numbers = []
  
  if game_hash[:home][:team_name] == team_name
      game_hash[:home][:players].each do |player, stats|  
          home_numbers << stats[:number]
      end
      home_numbers
  else 
      game_hash[:away][:players].each do |player, stats|
          away_numbers << stats[:number]
      end 
      away_numbers
   end
end
  
def player_stats(player_name)
  player_stats = {}
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, stats|
      if player == player_name
        player_stats = stats 
        return player_stats
      end 
    end
  end
end 

def big_shoe_rebounds
  
  player_biggest_shoe = 0
  
  game_hash.each do |team, team_data|
    team_data[:players].each do |player, stats|
      if stats.fetch(:shoe) > player_biggest_shoe
        player_biggest_shoe = stats.fetch(:shoe)
        return stats.fetch(:rebounds)
      end
    end 
  end
  
end 

