require "pry"

def game_hash
  game_hash =
{
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" => {
        :number => 0,
        :shoe => "16",
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      },
      "Reggie Evans" => {
        :number => 30,
        :shoe => "14",
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
      },
      "Brook Lopez" => {
        :number => 11,
        :shoe => "17",
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
      },
      "Mason Plumlee" => {
        :number => 1,
        :shoe => "19",
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
      },
      "Jason Terry" => {
        :number => 31,
        :shoe => "15",
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }
    }
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" => {
        :number => 4,
        :shoe => "18",
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      "Bismak Biyombo" => {
        :number => 0,
        :shoe => "16",
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
      },
      "Ben Gordon" => {
        :number => 8,
        :shoe => "15",
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      "Brendan Haywood" => {
        :number => 33,
        :shoe => "15",
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12
      },
      "DeSagna Diop" => {
        :number => 2,
        :shoe => "14",
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      }
    }
  }


}

end

def num_points_scored(name)
  if game_hash[:home][:players].has_key?(name)
    return game_hash[:home][:players][name][:points]
  else
    return game_hash[:away][:players][name][:points]
  end
end

def shoe_size(name)
  if game_hash[:home][:players].has_key?(name)
    return game_hash[:home][:players][name][:shoe].to_i
  else
    return game_hash[:away][:players][name][:shoe].to_i
  end
end

def team_colors(team_name)
  if game_hash[:home][:team_name] == team_name
    return game_hash[:home][:colors]
  else
    return game_hash[:away][:colors]
  end
end

def team_names
  arr = []
  arr.push(game_hash[:home][:team_name])
  arr.push(game_hash[:away][:team_name])
  return arr
end

def player_numbers(team_name)
  numbers = []
  if game_hash[:home][:team_name] == team_name
      game_hash[:home].each do |key, names|
        if key == :players
          names.each do |names, stats|
            stats.each do |stat, value|
                if stat == :number
                  numbers << value
                end
              end
            end
          end
        end
  elsif game_hash[:away][:team_name] == team_name
    game_hash[:away].each do |key, names|
      if key == :players
        names.each do |names, stats|
          stats.each do |stat, value|
              if stat == :number
                numbers << value
              end
            end
          end
        end
      end
  else
    puts "That team is not in this game."
  end
  numbers
end

def player_stats(name)
  stats = {}
  if game_hash[:home][:players].has_key?(name)
     game_hash[:home][:players][name].each do |stat, value|
       if value.class == String
         value = value.to_i
         stats[stat] = value
       else
         value
         stats[stat] = value
     end
     end
  else
    game_hash[:away][:players][name].each do |stat, value|
      if value.class == String
        value = value.to_i
        stats[stat] = value
      else
        value
        stats[stat] = value
    end
  end
end
stats
end


def shoe_size_max
shoe_sizes = []
game_hash[:home][:players].each do |name, value|
  value.each do |key, num|
    if key == :shoe
      shoe_sizes << num.to_i
    end
  end
  end
game_hash[:away][:players].each do |name, value|
  value.each do |key, num|
    if key == :shoe
      shoe_sizes << num.to_i
    end
  end
end
return shoe_sizes.max
end

def big_shoe_rebounds
    game_hash[:home][:players].each do |key, value|
      value.each do |k, v|
      max = shoe_size_max.to_s
      if max == v
      name = key
      return game_hash[:home][:players][name][:rebounds]
      else
      false
      end
end
      end
      end
