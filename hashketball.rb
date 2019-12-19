require "yaml"
require "pry"

# lib = YAML.load_file('game_hash.yml')

# pp lib

def game_hash
  YAML.load_file('game_hash.yml')
end

def num_points_scored(player)
  game_hash.each do |home_or_away, team_data|
    game_hash[home_or_away].each do |team_info_keys, team_info_val|
      game_hash[home_or_away][:players].each do |team_member|
        if team_member[:player_name] == player
          return team_member[:points]
        end
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |home_or_away, team_data|
    game_hash[home_or_away].each do |team_info_keys, team_info_val|
      game_hash[home_or_away][:players].each do |team_member|
        if team_member[:player_name] == player
          return team_member[:shoe]
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |home_or_away, team_data|
    game_hash[home_or_away].each do |team_info_k, team_info_val|
      if game_hash[home_or_away][:team_name] == team
        return game_hash[home_or_away][:colors]
      end
      # binding.pry
    end
  end
end

def team_names()
  teams = []
  game_hash.each do |home_or_away, team_data|
    game_hash[home_or_away].each do |team_info_k, team_info_val|
      if !teams.include?(game_hash[home_or_away][:team_name])
        teams << game_hash[home_or_away][:team_name]
      end
      # binding.pry
    end
  end
  teams
  # binding.pry
end