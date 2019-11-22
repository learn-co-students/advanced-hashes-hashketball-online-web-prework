# Write your code here!
require "pry"

def game_hash
{:home => {team_name:  "Brooklyn Nets", 
              colors: ["Black", "White"],
              players: [ 
                          {player_name: "Alan Anderson",
                          number: 0,
                           shoe: 16,
                           points: 22,
                           rebounds: 12,
                           assists: 12,
                           steals: 3,
                           blocks: 1,
                           slam_dunks:1
                          },
                          {player_name: "Reggie Evans",
                           number: 30,
                           shoe: 14,
                           points: 12,
                           rebounds: 12,
                           assists: 12,
                           steals: 12,
                           blocks: 12,
                           slam_dunks:7
                          },
                          {player_name: "Brook Lopez",
                           number: 11,
                           shoe: 17,
                           points: 17,
                           rebounds: 19,
                           assists: 10,
                           steals: 3,
                           blocks: 1,
                           slam_dunks:15
                          },
                          {player_name: "Mason Plumlee",
                           number: 1,
                           shoe: 19,
                           points: 26,
                           rebounds: 11,
                           assists: 6,
                           steals: 3,
                           blocks: 8,
                           slam_dunks:5
                          },
                          {player_name: "Jason Terry",
                           number: 31,
                           shoe: 15,
                           points: 19,
                           rebounds: 2,
                           assists: 2,
                           steals: 4,
                           blocks: 11,
                           slam_dunks:1
                          }
                        ]
                },
      :away => {team_name:  "Charlotte Hornets", 
                 colors: ["Turquoise", "Purple"],
                 players: [ 
                          {player_name: "Jeff Adrien",
                           number: 4,
                           shoe: 18,
                           points: 10,
                           rebounds: 1,
                           assists: 1,
                           steals: 2,
                           blocks: 7,
                           slam_dunks:2
                          },
                          {player_name: "Bismack Biyombo",
                           number: 0,
                           shoe: 16,
                           points: 12,
                           rebounds: 4,
                           assists: 7,
                           steals: 22,
                           blocks: 15,
                           slam_dunks:10
                          },
                          {player_name: "DeSagna Diop",
                           number: 2,
                           shoe: 14,
                           points: 24,
                           rebounds: 12,
                           assists: 12,
                           steals: 4,
                           blocks: 5,
                           slam_dunks:5
                          },
                          {player_name: "Ben Gordon",
                           number: 8,
                           shoe: 15,
                           points: 33,
                           rebounds: 3,
                           assists: 2,
                           steals: 1,
                           blocks: 1,
                           slam_dunks:0
                          },
                          {player_name: "Kemba Walker",
                           number: 33,
                           shoe: 15,
                           points: 6,
                           rebounds: 12,
                           assists: 12,
                           steals: 7,
                           blocks: 5,
                           slam_dunks:12
                          }]
                }
  }
end

def num_points_scored(player_name)
  game_hash.each do |home_or_away, team_details|
    team_details[:players].each do |player_stats|
      if player_stats[:player_name] == player_name
        return player_stats[:points]
      end #if 
      #binding.pry
    end #team_details
  end #game_hash
end

def shoe_size(player_name)
  game_hash.each do |home_or_away, team_details|
    team_details[:players].each do |player_stats|
      if player_stats[:player_name] == player_name
        return player_stats[:shoe]
      end #if 
      #binding.pry
    end #team_details
  end #game_hash
end

def team_colors(team_name)
  game_hash.each do |home_or_away, team_details|
    if team_details[:team_name] == team_name
      return team_details[:colors]
      #binding.pry
    end #team_details
  end #game_hash
end

def team_names
  team_names = []
  game_hash.each do |home_or_away, team_details|
    team_names << team_details[:team_name]
    #binding.pry
  end #game_hash
  team_names
end

def player_numbers(team_name)
  jersey_nums = []
  game_hash.each do |home_or_away, team_details|
    if team_details[:team_name] == team_name
      team_details[:players].each do |player_stats|
        jersey_nums << player_stats[:number]
      end  
    end #if 
    #binding.pry
  end #game_hash
  return jersey_nums
end

def player_stats(player_name)
  stats_by_name = {}
  game_hash.each do |home_or_away, team_details|
    team_details[:players].each do |player_stat|
      if player_stat[:player_name] == player_name
        stats_by_name = { number:  player_stat[:number],
                           shoe: player_stat[:shoe],
                           points: player_stat[:points],
                           rebounds: player_stat[:rebounds],
                           assists: player_stat[:assists],
                           steals: player_stat[:steals],
                           blocks: player_stat[:blocks],
                           slam_dunks: player_stat[:slam_dunks]
                         }
        return stats_by_name
      end #if 
      #binding.pry
    end #team_details
  end #game_hash
end
  
def big_shoe_rebounds
  biggest_shoe = 0
  big_shoe_reb = 0
  game_hash.each do |home_or_away, team_details|
    team_details[:players].each do |player_stats|
      if player_stats[:shoe] > biggest_shoe
        biggest_shoe = player_stats[:shoe]
        big_shoe_reb = player_stats[:rebounds]
      end #if 
      #binding.pry
    end #team_details
  end #game_hash
  return big_shoe_reb
end

def most_points_scored
  most_points = 0
  most_points_player = ""
  game_hash.each do |home_or_away, team_details|
    team_details[:players].each do |player_stats|
      if player_stats[:points] > most_points
        most_points = player_stats[:points]
        most_points_player = player_stats[:player_name]
      end #if 
      #binding.pry
    end #team_details
  end #game_hash
  return most_points_player
end
  
def most_steals_player
  most_steals = 0
  most_steals_player = ""
  game_hash.each do |home_or_away, team_details|
    team_details[:players].each do |player_stats|
      if player_stats[:steals] > most_steals
        most_steals = player_stats[:steals]
        most_steals_player = player_stats[:player_name]
      end #if 
      #binding.pry
    end #team_details
  end #game_hash
  return most_steals_player
end

def player_with_longest_name
  longest_name_length = 0
  longest_name_player = ""
  game_hash.each do |home_or_away, team_details|
    team_details[:players].each do |player_stats|
      if player_stats[:player_name].length > longest_name_length
        longest_name_length = player_stats[:player_name].length
        longest_name_player = player_stats[:player_name]
      end #if 
      #binding.pry
    end #team_details
  end #game_hash
  return longest_name_player
end

def winning_team
  max_points = 0
  winning_team = ""
  game_hash.each do |home_or_away, team_details|
    team_total = 0
    
    team_details[:players].each do |player_stats|
      team_total += player_stats[:points]
      #binding.pry
    end #team_details
    if team_total > max_points
      max_points = team_total
      winning_team = team_details[:team_name]
    end #if
  end #game_hash
  return winning_team
end


def long_name_steals_a_ton?
  longest_name = player_with_longest_name
  most_steals = most_steals_player
  
  if longest_name == most_steals 
    return true 
  else 
    return false 
  end
end