require "pry"

def game_hash
  g_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ['Black', 'White'],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        }, {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        }, {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17, 
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        }, {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        }, {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
        ]
    },  
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ['Turquoise', 'Purple'],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        }, {
          :player_name => "Bismack Biyombo",
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        }, {
          :player_name => "DeSagna Diop",
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        }, {
          :player_name => "Ben Gordon",
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        }, {
          :player_name => "Kemba Walker",
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
        ]
    }
  }
end

def num_points_scored(pl_name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
    
  home_players.each do |hp|
    if hp[:player_name] == pl_name
      return hp[:points]
    end
  end

  away_players.each do |ap|
    if ap[:player_name] == pl_name
      return ap[:points]
    end
  end
end

def shoe_size(pl_name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
    
  home_players.each do |hp|
    if hp[:player_name] == pl_name
      return hp[:shoe]
    end
  end

  away_players.each do |ap|
    if ap[:player_name] == pl_name
      return ap[:shoe]
    end
  end
end

def team_colors(team_name)
  home_team_name = game_hash[:home][:team_name]
  away_team_name = game_hash[:away][:team_name]
  
  if home_team_name == team_name
    game_hash[:home][:colors]
  else
    game_hash[:away][:colors]
  end
end

def team_names
  teams = []
  game_hash.each do |key, value|
    teams << game_hash[key][:team_name]
  end
  teams
end

def player_numbers(team_name)
  home_jersey_nums = []
  away_jersey_nums = []

  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:players].each do |player|
      home_jersey_nums.push(player[:number])
    end
    return home_jersey_nums
  end

  if game_hash[:away][:team_name] == team_name
    game_hash[:away][:players].each do |player|
      away_jersey_nums.push(player[:number])
    end
    return away_jersey_nums
  end
end

def player_stats(player_name)
  stats_hash = {}
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players
        data.each do |player|
          if player[:player_name] == player_name
              stats_hash = player.delete_if do |key, value|
                  key == :player_name
              end
          end
        end
      end
    end
  end
  stats_hash
end

def big_shoe_rebounds
  shoe_sizes = []
  total = 0
  game_hash.map do |place, team|
    team[:players].each do |player|
      shoe_sizes << player[:shoe]
    end
  end
  
  shoe_sizes.each do |size|
    if size > total
      total = size
    end
  end
  total
  
  game_hash.map do |place, team|
    team[:players].each do |player|
      if player[:shoe] == total
        return player[:rebounds]
      end
    end
  end 
end

def most_points_scored
  points = []
  total = 0
  game_hash.map do |place, team|
    team[:players].each do |player|
      points << player[:points]
    end
  end
  
  points.each do |amt|
    if amt > total
      total = amt
    end
  end
  total
  
  game_hash.map do |place, team|
    team[:players].each do |player|
      if player[:points] == total
        return player[:player_name]
      end
    end
  end
end

def winning_team
  home_sum = game_hash[:home][:players].reduce(0) do |h_sum, pts|
    h_sum += pts[:points]
  end

  away_sum = game_hash[:away][:players].reduce(0) do |a_sum, pts|
    a_sum += pts[:points]
  end

  if home_sum > away_sum
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end  
end

def player_with_longest_name
  name_length = []
  total = 0
  game_hash.map do |place, team|
    team[:players].each do |player|
      name_length << player[:player_name].length
    end
  end
  
  name_length.each do |nsize|
    if nsize > total
      total = nsize
    end
  end
  
  game_hash.map do |place, team|
    team[:players].each do |player|
      if player[:player_name].length == total
        return player[:player_name]
      end
    end
  end
end
  
def long_name_steals_a_ton?
  steals = []
  total = 0
  game_hash.map do |place, team|
    team[:players].each do |player|
      steals << player[:steals]
    end
  end
  
  steals.each do |steal_amt|
    if steal_amt > total
      total = steal_amt
    end
  end
  total
  
   game_hash.map do |place, team|
    team[:players].each do |player|
      if player[:player_name].length == player_with_longest_name.length
        if player[:steals] == total
          return true
        end
      end
    end
  end
end



