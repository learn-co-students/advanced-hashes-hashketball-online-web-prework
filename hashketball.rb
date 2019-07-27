require "pry"

def game_hash
game_hash = {
  :home=>{
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players=>{
      "Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      "Reggie Evans" => {
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      "Brook Lopez" => {
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15 #How is this possible haha
      },
      "Mason Plumlee" => {
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      "Jason Terry" => {
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
    },
  },
  :away=>{
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players=>{
      "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      "Bismack Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },
      "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      "Kemba Walker" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }
    },
  }
}

game_hash
end

def num_points_scored(player_name)
  game_hash.each do |location, team_attributes|
    team_attributes.each do |attribute, data|
      if data.include?(player_name)
        return game_hash[location][attribute][player_name][:points]
      end
    end
  end
end

def shoe_size(player_shoe)
  game_hash.each do |location, team_attributes|
    team_attributes.each do |attribute, data|
      if data.include?(player_shoe)
        return game_hash[location][attribute][player_shoe][:shoe]
      end
    end
  end
end

def team_colors(nba_team)
  game_hash.each do |location, team_attributes|
    if game_hash[location].values.include?(nba_team)
      team_attributes.each do |attribute, data|
        if attribute == :colors
          return data
        end
      end
    end
  end
end

def team_names
  nba_name = []
  game_hash.each do |location, team_attributes|
    team_attributes.each do |attribute, data|
      if attribute == :team_name
        nba_name << data
      end
    end
  end
return nba_name
end

def player_numbers(nba_team_name)
  jersey_numbers = []
  if game_hash[:home][:team_name] == nba_team_name
    game_hash[:home][:players].each do |name, stats|
      stats.each do |stat_label, stat_value|
        if stat_label == :number
          jersey_numbers << stat_value
        end
      end
    end
  else
    game_hash[:away][:players].each do |name, stats|
      stats.each do |stat_label, stat_value|
        if stat_label == :number
          jersey_numbers << stat_value
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(player_info)
  game_hash.each do |location, team_attributes|
    team_attributes.each do |attribute, data|
      if data.include?(player_info)
        return game_hash[location][attribute][player_info]
      end
    end
  end
end

def big_shoe_rebounds
  hash = game_hash
  player_name = ""
  shoe_size = 0
  hash.each do |location, team_attributes|
    team_attributes.each do |attribute, data|
      if data.class == Hash
        data.each do |player, stats|
            stats.each do |stat, int|
              if stat == :shoe
                if int > shoe_size
                  shoe_size = int
                  player_name = player
                end
              end
            end
          end
        return hash[location][attribute][player_name][:rebounds]
      end
    end
  end
end

def most_points_scored
  most_points = 0
  most_points_scored = "player"
  game_hash.each do |location, team_attributes|
    team_attributes.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if stats[:points] > most_points
            most_points = stats[:points]
            most_points_scored = player
          end
        end
      end
    end
  end
  most_points_scored
end

def winning_team
  away_total = 0
  home_total = 0
    game_hash[:away][:players].each do |name, stats|
      away_total += stats[:points]
    end
    game_hash[:home][:players].each do |name, stats|
      home_total += stats[:points]
    end
    if away_total > home_total
       game_hash[:away][:team_name]
    elsif away_total < home_total
       game_hash[:home][:team_name]
    else
      "It's a tie!"
    end
end

def player_with_longest_name
  longest_name_length = 0
  player_with_longest_name = "player"
  game_hash.each do |location, team_attributes|
    team_attributes.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if player.length > longest_name_length
            longest_name_length = player.length
            player_with_longest_name = player
          end
        end
      end
    end
  end
  player_with_longest_name
end

def long_name_steals_a_ton?
  best_steals = 0
  player_with_best_steals = "player"
  game_hash.each do |location, team_attributes|
    team_attributes.each do |attribute, data|
      if attribute == :players
        data.each do |player, stats|
          if stats[:steals] > best_steals
            best_steals = stats[:steals]
            player_with_best_steals = player
          end
        end
      end
    end
  end
  if player_with_best_steals == player_with_longest_name
    return true
  end
end
