require 'pry'

def game_hash
  {    home: { team_name: 'Brooklyn Nets',
              colors: %w[Black White], #%w(foo bar) is a shortcut for ["foo", "bar"]
              players: [
                { player_name: 'Alan Anderson',
                  number: 0,
                  shoe: 16,
                  points: 22,
                  rebounds: 12,
                  assists: 12,
                  steals: 3,
                  blocks: 1,
                  slam_dunks: 1 },
                { player_name: 'Reggie Evans',
                  number: 30,
                  shoe: 14,
                  points: 12,
                  rebounds: 12,
                  assists: 12,
                  steals: 12,
                  blocks: 12,
                  slam_dunks: 7 },
                { player_name: 'Brook Lopez',
                  number: 11,
                  shoe: 17,
                  points: 17,
                  rebounds: 19,
                  assists: 10,
                  steals: 3,
                  blocks: 1,
                  slam_dunks: 15 },
                { player_name: 'Mason Plumlee',
                  number: 1,
                  shoe: 19,
                  points: 26,
                  rebounds: 11,
                  assists: 6,
                  steals: 3,
                  blocks: 8,
                  slam_dunks: 5 },
                { player_name: 'Jason Terry',
                  number: 31,
                  shoe: 15,
                  points: 19,
                  rebounds: 2,
                  assists: 2,
                  steals: 4,
                  blocks: 11,
                  slam_dunks: 1 }
              ] },
    away: { team_name: 'Charlotte Hornets',
            colors: %w[Turquoise Purple],
            players: [
              { player_name: 'Jeff Adrien',
                number: 4,
                shoe: 18,
                points: 10,
                rebounds: 1,
                assists: 1,
                steals: 2,
                blocks: 7,
                slam_dunks: 2 },
              { player_name: 'Bismack Biyombo',
                number: 0,
                shoe: 16,
                points: 12,
                rebounds: 4,
                assists: 7,
                steals: 22,
                blocks: 15,
                slam_dunks: 10 },
              { player_name: 'DeSagna Diop',
                number: 2,
                shoe: 14,
                points: 24,
                rebounds: 12,
                assists: 12,
                steals: 4,
                blocks: 5,
                slam_dunks: 5 },
              { player_name: 'Ben Gordon',
                number: 8,
                shoe: 15,
                points: 33,
                rebounds: 3,
                assists: 2,
                steals: 1,
                blocks: 1,
                slam_dunks: 0 },
              { player_name: 'Kemba Walker',
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 7,
                blocks: 5,
                slam_dunks: 12 }
            ] }
}
end

def num_points_scored(specific_player) #Players are inputed into this parameter to find the points they scored
  # binding.pry
    #Going down the rabbit whole of the game_hash to access the players points
  game_hash.each do |location, team_data| #location accesses :home and :away  /// team_data is the next hash level, the entire data for each team
    # binding.pry
    team_data[:players].each do |player| #this accesses the players array of hashes, player is each individual player hash
      # binding.pry
      if player[:player_name] == specific_player #if player_name is equal to the specific_player entered in this method, return that players points
        return player[:points]
      end
    end
  end
end

#shoe_size is the exact same method as num_points_scored
def shoe_size(specific_player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player|
      if player[:player_name] == specific_player
        return player[:shoe]
      end
    end
  end
end

def team_colors(team)
  # binding.pry
  game_hash.each do |location, team_data|
    # binding.pry
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end

def team_names #return array of team names [array]
  teams_array = []  #create new array to hold data from within hash
  game_hash.each do |location, team_data| #iterate through hash accessing data within :home and :away
    teams_array << team_data[:team_name] #shovel team_name to teams_array
  end
  teams_array #return teams_array
end

def player_numbers(team_name) #method takes argument team_name
  jersey_number = [] #creates array
  game_hash.each do |location, team_data| #iterates to access team_data for home and away teams_array
  if team_data[:team_name] == team_name #if team_name accessed, matches team entered in param
    team_data[:players].each do |stats_keys| #access players statistical keys, :number, :shoe, :points. etc.
      # binding.pry
      jersey_number << stats_keys[:number] #shovel :number to jersey_number array
    end
  end
end
jersey_number # return new array
end

def player_stats(player)
  new_hash = {}
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute|
      if attribute[:player_name] == player
        new_hash[:number] = attribute[:number]
        new_hash[:shoe] = attribute[:shoe]
        new_hash[:points] = attribute[:points]
        new_hash[:rebounds] = attribute[:rebounds]
        new_hash[:assists] = attribute[:assists]
        new_hash[:steals] = attribute[:steals]
        new_hash[:blocks] = attribute[:blocks]
        new_hash[:slam_dunks] = attribute[:slam_dunks]
      end
    end
  end
  new_hash
end

def big_shoe_rebounds
  shoe_size = 0 #counter
  rebounds = 0 #counter
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute| #iterating to player stats_keys
      # binding.pry
      if attribute[:shoe] > shoe_size #if specific_player shoe is > current shoe
        shoe_size = attribute[:shoe] #set new value
        rebounds = attribute[:rebounds] #set that players rebounds
      end
    end
  end
  rebounds
end

# Bonus


# def good_practices
#   game_hash.each do |location, team_data|
#     #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
#     binding.pry
#     team_data.each do |attribute, data|
#       #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
#       binding.pry
#
#       #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
#       data.each do |data_item|
#           binding.pry
#       end
#     end
#   end
# end
# good_practices
