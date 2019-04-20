require 'pry'

def game_hash

da_hash = {
  :home => {
    :team_name => "Brooklyn Nets" ,
    :colors => ["Black", "White"] ,
    :players => {
      "Alan Anderson" => {
        :number => 0 ,
        :shoe => 16 ,
        :points => 22 ,
        :rebounds => 12 ,
        :assists => 12 ,
        :steals => 3 ,
        :blocks => 1 ,
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
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
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
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
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
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
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
        "Brendan Haywood" => {
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



def num_points_scored(name)
  hash = game_hash
  hash.each do |location, data|
    data.each do |attribute, playername|
      if playername.include?(name)
        return hash[location][attribute][name][:points]
      end
    end
  end
end

def shoe_size(name)
  hash = game_hash
  hash.each do |location, data|
    data.each do |attribute, playername|
      if playername.include?(name)
        return hash[location][attribute][name][:shoe]
      end
    end
  end
end

def team_colors(team)
  array = []
  hash = game_hash
  hash.each do |location, info|
    info.each do |info, teamname|
      if teamname.include?(team)
        array = hash[location][:colors]
      end
    end
  end
  array
end

def team_names
  array = []
  hash = game_hash
  hash.each do |location, info|
        array << hash[location][:team_name]
  end
  array
end

def player_numbers(team)
  new_array = []
  if game_hash[:home][:team_name] == team
    game_hash[:home][:players].each do |name, stats|
      stats.each do |stat_label, stat_value|
        if stat_label == :number
          new_array << stat_value
        end
      end
    end
  else
    game_hash[:away][:players].each do |name, stats|
      stats.each do |stat_label, stat_value|
        if stat_label == :number
          new_array << stat_value
        end
      end
    end
  end
  new_array
end

# player_stats takes in an argument of a player's name and returns a hash of that player's stats
def player_stats(players_name)
  hash = {}
  game_hash.each do |location, attribute|
    attribute.each do |attribute, players|
      if players.include?(players_name)
        hash = game_hash[location][attribute][players_name]
      end
    end
  end
  hash
end

#big_shoe_rebounds returns the number of rebounds of the player with the biggest shoe size
def big_shoe_rebounds
  hash = game_hash
  player_name = ""
  shoe_size = 0
  hash.each do |location, attributes|
    attributes.each do |attribute, info|
      if info.class == Hash
        info.each do |player, stats|
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
