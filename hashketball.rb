# Write your code here!
require "pry"

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
        }
      }
      
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
        }
      }
    }
  }
end

def num_points_scored(name)
  points = 0
  if game_hash[:home][:players].include?(name)
    points = game_hash[:home][:players][name][:points]
  elsif game_hash[:away][:players].include?(name)
    points = game_hash[:away][:players][name][:points]
  else
    puts "Player not found"
  end
  points
end
  
def shoe_size(name)
  size = 0
  if game_hash[:home][:players].include?(name)
    size = game_hash[:home][:players][name][:shoe]
  elsif game_hash[:away][:players].include?(name)
    size = game_hash[:away][:players][name][:shoe]
  else
    puts "Player not found"
  end
  size
end

def team_colors(name)
  colors = []
  if game_hash[:home][:team_name] == name
    colors = game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == name
    colors = game_hash[:away][:colors]
  else
    puts "Team not found"
  end
  colors
end

def team_names
  names = []
  game_hash.each do |key, val|
    val.each do |attribute, data|
      if attribute == :team_name
        names << data
      end
    end
  end
  names
end

def player_numbers(team_name)
  numbers = []
  if game_hash[:home][:team_name] == (team_name)
    game_hash[:home][:players].each do |player, stat|
      stat.each do |stat, data|
        if stat == :number
          numbers << data
        end
      end
    end
  else
    game_hash[:away][:players].each do |player, stat|
      stat.each do |stat, data|
        if stat == :number
          numbers << data
        end
      end
    end
  end
  numbers
end

def player_stats(name)
  stats = {}
  if game_hash[:home][:players].include?(name)
    stats = game_hash[:home][:players][name]
  else
    stats = game_hash[:away][:players][name]
  end
  stats
end

def big_shoe_rebounds
  big_shoe = 0 
  rebounds = 0 
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, data|
          if data[:shoe] > big_shoe
            big_shoe = data[:shoe]
            rebounds = data[:rebounds]
          end
        end
      end
    end  
  end
  rebounds 
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry
 
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end





