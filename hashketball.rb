require 'pp'
def game_hash # defined method
new_hash = {# created new hash

  :home => { # within new hash created key called home
      team_name: "Brooklyn Nets", # key within hash with team name
      colors: ["Black", "White"], # key with array of string
      players: [ # key with array
  "Alan Anderson" => { # key with hash
        number: 0, # keys and value  within hash
        shoe: 16, # keys and value  within hash
        points: 22, # keys and value  within hash
        rebounds: 12, # keys and value  within hash
        assists: 12, # keys and value  within hash
        steals: 3, # keys and value  within hash
        blocks: 1, # keys and value  within hash
        slam_dunks: 1, # keys and value  within hash
      },
  "Reggie Evans" => {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7,
      },
"Brook Lopez" => {
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15,
      },
"Mason Plumlee" => {
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 11,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5,
        steals: 3,
      },
 "Jason Terry" => {
        number: 31,
        shoe: 15,
        points: 19,
        rebounds: 2,
        assists: 2,
        steals: 4,
        blocks: 11,
        slam_dunks: 1,
      }
    ]
},

  :away => {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
  players: [
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

  "Bismack Biyombo" => {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 22,
        blocks: 15,
        slam_dunks: 10,
      },
  "DeSagna Diop" => {
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        blocks: 5,
        slam_dunks: 5,
        steals: 4
      },
  "Ben Gordon" => {
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0,
      },
  "Kemba Walker" => {
        number: 33,
        shoe: 15,
        points: 6,
        rebounds: 12,
        assists: 12,
        steals: 7,
        blocks: 5,
        slam_dunks: 12,
        }
      ]
    }
}
end

def num_points_scored(player_name) # defined method with argument
  game_hash.each do |team_name, team_value| # iterate through both teams which are keys
      team_value[:players].each do |players| # pick up players key from the orginal hash
        players.each do |name, stats| # got the hash of values and key called name and the keys for each player
          if name == player_name # if the name mataches the arg
            return stats[:points] # access the key : points value
          end # stops if
        end # stops player loop
    end # stops player names
  end # stops keys values of team
end # ends method

def shoe_size (player_name)
game_hash.each do |team_name, team_value| # iterate through both teams which are keys
    team_value[:players].each do |players| # pick up players key from the orginal hash
      players.each do |name, stats| # got the hash of values and key called name and the keys for each player
        if name == player_name # if the name mataches the arg
          return stats[:shoe] # access the key :shoe value
        end # stops if
      end # stops player loop
  end # stops player names
end # stops keys values of team
end # ends method

def team_colors(team_name)
game_hash.each do |team_location, team_value| # iterate through both teams which are keys
  if team_value[:team_name] == team_name # iterate through team_value block  to get info from team names if true
    return team_value[:colors] #  then from keys of team names return string array of colors
  end # if statment
end # stops keys values of team
end # ends method

def team_names()
  new_array = []
game_hash.each do |team_location, team_value| # iterate through both teams which are keys
new_array << team_value[:team_name]
end # stops keys values of team
new_array
end # ends method

def player_numbers(name)
  new_array_number = []
  game_hash.each do |team_name, team_value| # iterate through both teams which are keys
    if team_value[:team_name] == name
      team_value[:players].each do |players| # pick up players key from the orginal hash
        players.each do |name, stats| # got the hash of values and key called name and the keys for each player
          new_array_number << stats[:number]
        end # stops player loop
      end
      return new_array_number
    end
  end
end

def player_stats(player_name)
  game_hash.each do |team_name, team_value| # iterate through both teams which are keys
      team_value[:players].each do |players| # pick up players key from the orginal hash
        players.each do |name, stats| # got the hash of values and key called name and the keys for each player
          if name == player_name # if the name mataches the arg
            return stats # access the whole stats hash value
          end # stops if
        end # stops player loop
    end # stops player names
  end # stops keys values of team
end

def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each do |team_name, team_value| # iterate through both teams which are keys
      team_value[:players].each do |players| # pick up players key from the orginal hash
        players.each do |name, stats| # got the hash of values and key called name and the keys for each player
          if stats[:shoe] > biggest_shoe # if current player shoe is bigger than var biggest_shoe
            biggest_shoe = stats[:shoe] #store the shoe size to compare later
            rebounds = stats[:rebounds] #store the number of rebounds to return at the end
          end # stops if
        end # stops player loop
    end # stops player names
  end # stops keys values of team
  rebounds #return rebounds from the biggest lshoe
end
