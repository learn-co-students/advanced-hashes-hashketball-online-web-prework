# Write your code here!

def game_hash()
  {
    :home=>{
      :team_name =>"Brooklyn Nets",
      :colors => ["Black","White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :stats => {
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1
          }
        },
        {
          :player_name => "Reggie Evans",
          :stats => {
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7
          }
        },
        {
          :player_name => "Brook Lopez",
          :stats => {
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15
          }
        },
        {
          :player_name => "Mason Plumlee",
          :stats => {
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 11,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5
          }
        },
        {
          :player_name => "Jason Terry",
          :stats => {
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
      ]
    },
    :away=>{
      :team_name =>"Charlotte Hornets",
      :colors => ["Turquoise","Purple"],
      :players => [
        {
          :player_name => "Jeff Adrien",
          :stats => {
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2
          }
        },
        {
          :player_name => "Bismack Biyombo",
          :stats => {
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 22,
            :blocks => 15,
            :slam_dunks => 10
          }
        },
        {
          :player_name => "DeSagna Diop",
          :stats => {
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5
          }
        },
        {
          :player_name => "Ben Gordon",
          :stats => {
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0
          }
        },
        {
          :player_name => "Kemba Walker",
          :stats => {
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
      ]
    }
  }
end

def num_points_scored(supplied_name)
  lookup_player_stat(supplied_name,:points)
end

def shoe_size(supplied_name)
  lookup_player_stat(supplied_name,:shoe)
end

def lookup_player_stat(supplied_name,attribute)
  game_table  = game_hash
  game_table.map do |court_sides|
    players_list = court_sides[1][:players]
    players_list.map do |player|
      name = player[:player_name]
      if(name == supplied_name)
        return player[:stats][attribute]
      end
    end
  end
end

#====================================================

def team_colors(team)
  game_table = game_hash
  
  game_table.map do |court_sides|
    team_name = court_sides[1][:team_name]
    if(team_name == team)
      return court_sides[1][:colors]
    end
  end
end

def team_names
  game_table = game_hash
  teams = []
  
  game_table.map do |court_sides|
    teams << court_sides[1][:team_name]
  end
  teams
end

def player_numbers(team)
  game_table = game_hash
  jersey_numbers = []
  
  game_table.map do |court_sides|
    team_name = court_sides[1][:team_name]
    if(team == team_name)
      court_sides[1][:players].map do |player|
        jersey_numbers << player[:stats][:number]
      end
    end
  end
  
  return jersey_numbers.sort
end

def player_stats(supplied_name)
  game_table = game_hash
  
  game_table.map do |court_sides|
    players_list = court_sides[1][:players]
    players_list.map do |player|
      if(player[:player_name] == supplied_name)
        return player[:stats]
      end
    end
  end
end

def big_shoe_rebounds
  game_table = game_hash
  biggest_shoe_size = 0
  biggest_rebounds = 0
  
  game_table.map do |court_sides|
    player_list = court_sides[1][:players]
     
    player_list.map do |player|
      shoe_size = player[:stats][:shoe]
      rebounds = player[:stats][:rebounds]
      if(shoe_size > biggest_shoe_size)
        biggest_shoe_size = shoe_size
        biggest_rebounds = rebounds
      end
    end
  end
  biggest_rebounds
end

def most_points_scored
  game_table = game_hash
  max_score = 0
  max_scoring_player = ""
  game_table.map do |court_sides|
    court_sides[1][:players].map do |player|
      players_score = player[:stats][:points]
      if players_score > max_score
        max_score = players_score
        max_scoring_player = player[:player_name]
      end
    end
  end
  max_scoring_player
end

def winning_team
  game_table = game_hash
  
  max_score= 0 
  max_scoring_team = ""
  
  game_table.map do |court_sides|
    team_score = 0
    team_name = court_sides[1][:team_name]
    player_list = court_sides[1][:players]
    
    player_list.map do |player|
      team_score += player[:stats][:points]
    end
    if(team_score > max_score)
      max_score = team_score
      max_scoring_team = team_name
    end
  end
  max_scoring_team
end

def player_with_longest_name
  game_table = game_hash
  max_length = 0
  longest_player_name = ""
  
  game_table.map do |court_sides|
    player_list = court_sides[1][:players]

    
    player_list.map do |player|
      player_name_length = player[:player_name].length
      if player_name_length > max_length
        max_length = player_name_length
        longest_player_name = player[:player_name]
      end
    end
  end
  longest_player_name
end

def long_name_steals_a_ton?
  game_table = game_hash
  longest_name = player_with_longest_name
  longest_name_steals = player_stats(longest_name)[:steals]
  
  game_table.map do |court_sides|
    player_list = court_sides[1][:players]
    
    player_list.map do |player|
      if(player[:player_name] != longest_name && player[:stats][:steals] > longest_name_steals)
        return false
      end
    end
  end
  return true
end