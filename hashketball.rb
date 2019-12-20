require "yaml"
require "pry"

def game_hash
  YAML.load_file('game_hash.yml')
end

def num_points_scored(players_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(players_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end
end

def team_names()
  game_hash.map do |place, team|
    team[:team_name]
  end
end

def player_numbers(team_input)
  nums = []
  game_hash.each do |place, team|
    if team[:team_name] == team_input
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player|
            nums << player[:number]
          end
        end
      end
    end
  end
  nums
end

def player_stats(player_input)
  new_hash = {}
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == player_input
            new_hash = player.delete_if {|k,v| k == :player_name}
          end
        end
      end
    end
  end
  new_hash
end

# returns the number of rebounds of the player with the biggest shoe size
def big_shoe_rebounds
  new_hash = {}
  size_arr = []
  biggest_shoe_size = 0
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          size_arr << player[:shoe]
          # binding.pry
        end
        # binding.pry
      end
    end
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:shoe] == size_arr.max
            return player[:rebounds]
          end
        end
      end
    end
  end
end

def most_points_scored
  points_arr = []
  max_score = 0
  high_score_player = ""
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          points_arr << player[:points]
        end
      end
    end
  end
  max_score = points_arr.max
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          return player[:player_name] if player[:points] == max_score
        end
      end
    end
  end
end

def winning_team

end