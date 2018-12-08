# Write your code here!
require "pry"

def game_hash
  {
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
        "Mason Plumlee" =>{
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

def num_points_scored(player)
  game_hash.each do |location, team_data|
    team_data.each do |team_attributes, attribute_data|
      if team_attributes == :players
        attribute_data.each do |player_name, player_data|
          if player == player_name
            player_data.each do |player_attribute, data|
              if player_attribute == :points
                return data
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |location, team|
    team.each do |attribute, attribute_data|
      if attribute == :players
        attribute_data.each do |player_name, player_stats|
          if player_name == player
            return player_stats[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team|
    team.each do |attribute, attribute_data|
      if attribute == :team_name && attribute_data == team_name
        return team.fetch(:colors)
      end
    end
  end
end

def team_names
  names = []

  game_hash.each do |location, team|
    names << team[:team_name]
  end
  names
end

def player_numbers(team_name)

  numbers = []

  game_hash.each do |location, team|
    if team[:team_name] == team_name
      team[:players].each do |player_name, player_stats|
        player_stats.each do |stat_name, stat_value|
          if stat_name == :number
            numbers << stat_value
          end
        end
      end
    end
  end

  numbers
end

def player_stats(player_name)
  game_hash.each do |location, team|
    team.each do |team_attribute, team_values|
      if team_attribute == :players
        team_values.each do |player, player_stats|
          if player == player_name
            return player_stats
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  largest_shoe_size = 0
  largest_shoe_holder = ""

  game_hash.each do |location, team|
    team.each do |team_attribute, attribute_value|
      if team_attribute == :players
        attribute_value.each do |player_name, player_stats|
          player_stats.each do |stat_name, value|
            if stat_name == :shoe && value > largest_shoe_size
              largest_shoe_size = value
              largest_shoe_holder = player_stats
            end
          end
        end
      end
    end
  end
  largest_shoe_holder[:rebounds]
end

def most_points_scored
  most_points = 0
  mvp = ""

  game_hash.each do |location, team|
    team.each do |team_attribute, attribute_value|
      if team_attribute == :players
        attribute_value.each do |player_name, player_stats|
          player_stats.each do |stat_name, value|
            if stat_name == :points && value > most_points
              most_points = value
              mvp = player_name
            end
          end
        end
      end
    end
  end
  mvp
end

def winning_team
  total_score = 0
  greatest_score = 0
  victorious_team = ""

  game_hash.each do |location, team|
    team.each do |team_attribute, attribute_value|
       if team_attribute == :players
         attribute_value.each do |player_name, player_stats|
           total_score += player_stats[:points]
         end
         if total_score > greatest_score
           greatest_score = total_score
           total_score = 0
           victorious_team = team[:team_name]
         end
       end
    end
  end

  victorious_team
end

def player_with_longest_name
  name_length = 0
  player_with_name = ""

  game_hash.each do |location, team_hash|
    team_hash.each do |team_attribute, team_values|
      if team_attribute == :players
        team_values.each_key do |player_name|
          if player_name.length > name_length
            name_length = player_name.length
            player_with_name = player_name
          end
        end
      end
    end
  end

  player_with_name
end

def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  number_of_steals = 0
  steals_champion = ""

  game_hash.each do |location, team|
    team.each do |team_attribute, attribute_value|
      if team_attribute == :players
        attribute_value.each do |player_name, player_stats|
          if player_stats[:steals] > number_of_steals
            number_of_steals = player_stats[:steals]
            steals_champion = player_name
          end
        end
      end
    end
  end
  longest_name == steals_champion
end
