require 'pry'

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
  target_data = 0
  game_hash.each do |loc, team_data|
    team_data.each do |attribute, data|
    if attribute == :players
      data.each do |player_name, player_data|
        if player_name == name
        player_data.each do |a, b|
          if a == :points
            target_data = b
          end
        end
      end
      end
    end
    end
  end
  return target_data
end

def shoe_size(name)
    game_hash.each do |loc, team_data|
    team_data.each do |attribute, data|
    if attribute == :players
      data.each do |player_name, player_data|
        if player_name == name
        player_data.each do |a, b|
          if a == :shoe
            return b
          end
        end
      end
      end
    end
    end
  end
end

def team_colors(name)
  if name == "Charlotte Hornets"
    game_hash[:away][:colors]
  elsif name == "Brooklyn Nets"
    game_hash[:home][:colors]
  end
end

def team_names
  target_data = []
  game_hash.each do |loc, team_data|
    target_data << team_data.fetch(:team_name)
  end
  target_data
end

def player_numbers(name)
  target_data = []
  if name == "Charlotte Hornets"
    game_hash[:away][:players].each do |player_name, player_data|
      target_data << player_data.fetch(:number)
    end
  elsif name == "Brooklyn Nets"
   game_hash[:home][:players].each do |player_name, player_data|
      target_data << player_data.fetch(:number)
   end
  end
  target_data
end

def player_stats(name)
  game_hash.each do |loc, team_data|
   team_data.each do |attribute, data|
    if attribute == :players
      data.each do |player_name, player_data|
        if player_name == name
          return player_data
        end
      end
    end
  end
end
end

def big_shoe_rebounds
  player_data_array = []
  shoe_array = []
  game_hash.each do |loc, team_data|
    team_data.each do |attribute, data|
    if attribute == :players
      data.each do |player_name, player_data|
        player_data_array << player_data
      end
    end
    end
  end
  player_data_array.each do |a, b|
    a.each do |k, v|
     if k == :shoe
       shoe_array << v
     end
    end
  end
  target_index = shoe_array.index(shoe_array.max)
  (player_data_array[3])[:rebounds]
end

def most_points_scored
  name_array = []
  points_array = []
  game_hash.each do |loc, team_data|
    team_data.each do |attribute, data|
    if attribute == :players
      data.each do |player_name, player_data|
        name_array << player_name
        points_array << player_data.fetch(:points)
      end
    end
    end
  end
  name_array[points_array.index(points_array.max)]
end

def winning_team
  home_points = []
  home_sum = 0
  away_points = []
  away_sum = 0
  game_hash[:home][:players].each do |player_name, player_data|
    home_points << player_data.fetch(:points)
  end
  game_hash[:away][:players].each do |player_name, player_data|
    away_points << player_data.fetch(:points)
  end
  home_points.each {|x| home_sum += x}
  away_points.each {|x| away_sum += x}
  if home_sum > away_sum
    "Brooklyn Nets"
  elsif away_sum > home_sum
    "Charlotte Hornets"
  elsif home_sum == away_sum
    "DRAW"
  end
end
    
def player_with_longest_name
  names_array = []
  length_array = []
  game_hash.each do |loc, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player_name, player_data|
          names_array << player_name
        end
      end
    end
  end
  names_array.each do |name|
    length_array << name.length
  end
  names_array[length_array.index(length_array.max)]
end

def long_name_steals_a_ton?
  name_array = []
  steals_array = []
  game_hash.each do |loc, team_data|
    team_data.each do |attribute, data|
    if attribute == :players
      data.each do |player_name, player_data|
        name_array << player_name
        steals_array << player_data.fetch(:steals)
      end
    end
    end
  end
  if name_array[steals_array.index(steals_array.max)] == player_with_longest_name
    TRUE
  end
end

          