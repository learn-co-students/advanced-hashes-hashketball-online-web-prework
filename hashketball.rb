require "pry"

def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
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
          :slam_dunks => 15 
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
      }
    }
  }
  game
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry
 
      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end


def num_points_scored(player)
  points = nil
  
  game_hash.reduce({}) do |g_memo, (g_key, g_value)|
    if g_value[:players].include?(player)
      points = g_value[:players][player][:points]
    end
  end

  points

end

def shoe_size(player)
  shoe = nil
  
  game_hash.reduce({}) do |g_memo, (g_key, g_value)|
    if g_value[:players].include?(player)
      shoe = g_value[:players][player][:shoe]
    end
  end
  
  shoe
end

def team_colors(team)
  colors = nil
  
  game_hash.reduce({}) do |g_memo, (g_key, g_value)|
    if g_value[:team_name] == team
      colors = g_value[:colors]
    end
  end
  
  colors
end

def team_names
  teams = []
  
  game_hash.reduce({}) do |g_memo, (g_key, g_value)|
    teams.push(g_value[:team_name])
  end
  
  teams
end


def player_numbers(team)
  numbers = []
  
  game_hash.reduce({}) do |g_memo, (g_key, g_value)|
    if g_value[:team_name] == team
      g_value[:players].reduce({}) do |player_memo, (player_key, player_value)|
        numbers.push(player_value[:number])
      end
    end
  end
  
  numbers
end

def player_stats(player)
  stats = {}
  
  game_hash.reduce({}) do |g_memo, (g_key, g_value)|
    if g_value[:players].include?(player)
      stats = g_value[:players][player]
    end
  end
  
  stats
end

def big_shoe_rebounds
  rebounds = nil
  shoe = 0
  
  game_hash.reduce({}) do |g_memo, (g_key, g_value)|
    g_value[:players].reduce({}) do |player_memo, (player_key, player_value)|
      if player_value[:shoe] > shoe
        shoe = player_value[:shoe]
        rebounds = player_value[:rebounds]
      end
    end
  end
  
  rebounds
end

def most_points_scored
  player = nil
  points = 0
  
  game_hash.reduce({}) do |g_memo, (g_key, g_value)|
    g_value[:players].reduce ({}) do |player_memo, (player_key, player_value)|
      if player_value[:points] > points
        points = player_value[:points]
        player = player_key
      end
    end
  end
  
  player
end

def winning_team
  home_team = game_hash[:home][:team_name]
  away_team = game_hash[:away][:team_name]
  home_total = 0
  away_total = 0
  
  game_hash.reduce({}) do |g_memo, (g_key, g_value)|
    if g_key == :home
      g_value[:players].reduce({}) do |home_memo, (home_key, home_value)|
        home_total += home_value[:points]
      end
    else
      g_value[:players].reduce({}) do |away_memo, (away_key, away_value)|
        away_total += away_value[:points]
      end
    end
  end
  
  if home_total > away_total
    return home_team
  else
    return away_team
  end
  
end

def player_with_longest_name
  name_length = 0
  name_placeholder = ""
  player_name = nil
  
  game_hash.reduce({}) do |g_memo, (g_key, g_value)|
    g_value[:players].reduce ({}) do |player_memo, (player_key, player_value)|
      name_placeholder = player_key
      if name_placeholder.length > name_length
        name_length = name_placeholder.length
        player_name = name_placeholder
      end
    end
  end
  
  player_name
end

def long_name_steals_a_ton?
  most_steals = 0
  longest_name_steals_most = false
  
  game_hash.reduce({}) do |g_memo, (g_key, g_value)|
    g_value[:players].reduce({}) do |player_memo, (player_key, player_value)|
      if player_value[:steals] > most_steals
        most_steals = player_value[:steals]
      end
    end
  end
  
  game_hash.reduce({}) do |g_memo, (g_key, g_value)|
    if g_value[:players].include?(player_with_longest_name)
      if g_value[:players][player_with_longest_name][:steals] == most_steals
        longest_name_steals_most = true
      end
    end
  end

  longest_name_steals_most
end








