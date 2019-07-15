# Write your code here!
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
                "Mason Plumlee" => {
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


# def num_points_scored(player_name)
#   #find the player
#   #return the points 
#   game_hash.each do |location, team_data| #home or away, team_data #everything inside of the hash
#     team_data[:players].each do |player, stats|
#   end
# end

def num_points_scored(player_name)
find_player(player_name)[:points]
end

# def shoe_size(player_name)
  
# end

# def player_stats(player_name)
#   game_hash.keys.each do |team|
#     if game_hash[team][:players].keys.includes?(player_name)
#       return game_hash[team][:players][player_name]
#     end
#   end
# end


# def find_player(player_name)
#       game_hash.each do |loc, team_data|
#     if team_data[:players].include?(player_name)
#       return team_data[:players][player_name]
#     end
#   end
# end

def find_player(player_name)
  home_players = game_hash[:home][:players]
  away_players = game_hash[:away][:players]
  
  all_players = home_players.merge(away_players) #combines hash
  
  all_players[player_name]
  
  
end

def winning_team
  home_players_points = game_hash[:home][:players][:points]
  away_players_points = game_hash[:away][:players][:points]
  
  if home_players_points.sum > away_players_points.sum
    return game_hash[:home]
  elsif home_players_points.sum = away_players_points.sum
    return "A tie"
  else
    return game_hash[:away]
  end
end

winning_team

def winning_team
  points = Hash.new(0) #creates a new hash with a default value of 10
  team = ""
  game_hash.keys.each do |team|
    game_hash[team][:players].each do |player, stats|
      points[team] += stats[:points]
    end
  end
  game_hash[points.keys.max][:team_name]
end
  









