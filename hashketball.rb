require "pry"

def game_hash
  {
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
            ] },
    home: { team_name: 'Brooklyn Nets',
            colors: %w[Black White],
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
            ] }
  }
end





# GOAL: to find out the number of points scored by a player

def num_points_scored(name)
 # Takes argument of player's name.
 
  game_hash.each do |location, info|
   # Iterate through top level hash with block parameters.
   
      info[:players].each do |player|
      # Iterate specifically through :players array of hashes (which is inside info).
      
        return player[:points] if player[:player_name] == name
        # Return (and stop looking) the :points info if the :player_name info matches the passed in name. Can do this on same hash level?
        
    end
  end
end




def shoe_size(name)
  game_hash.each do |location, team|
    team.each do |key, value|
      next unless key == :players
      value.each do |player|
        return player[:shoe] if player[:player_name] == name
      end
    end
  end
end
      
      
      
def team_colors(name)
  
  game_hash.each do |location, team|
  # Search through top level of hashes.
  
    return team[:colors] if team[:team_name] == name
    # Return (and stop searching for) :colours info if the :team_name info matches the passed in name. Can do this on same hash level but can access deeper level by adding [] notation.
    
  end
end



def team_names
  game_hash.collect do |location, team|
  # Search through top level of hashes.
  
    team[:team_name]
    # Returns all the team names.
    # Use .collect as we want the info in a new array (ordered list). Don't need to return as .collect does it.
    
  end
end




def player_numbers(team_name)
  new_array = []
  # New array to store numbers.
  
  game_hash.each do |location, team|
  # Iterate through hash to search top level for team name (not storing).
  
    next unless team[:team_name] == team_name
    # Go to next block unless we find team name that is equal to passed in team name.
  
      team[:players].each do |data|
      # Now that we have correct team_name, iterate specifically through :players
      
        new_array << data[:number]
        # Push player number to new array (not using method as we specifically want that number, not the whole hash that comes with it).
    end
  end 
new_array
# Return new array.
end




def player_stats(player_name)
  
  new_hash = {}
  # Create new hash to store final results. Want it to be a hash as :players is an array of hashes and uses keys.
  
  game_hash.each do |place, team|
  # Iterate through and top level. Don't care what the return value is so don't use .collect.
      
      team[:players].each do |data|

        next unless data[:player_name] == player_name
        # Move on to the next block unless the value for :player_name (inside :players) matches the passed in player name.
        
        new_hash = data.delete_if do |key, value|
          key == :player_name
          # Sets player (represents all the attributes in :players array of hashes once the player name matches) to new_hash.
          # In the new_hash, after checking the match (above) the player's name isn't needed in the final hash so .delete_if gets rid of it.
          
    
      end
    end
  end
  new_hash
  # Returns the new hash.
  
end

=begin
def player_stats(player_name)
  
  new_hash = {}
  # Create new hash to store final results. Want it to be a hash as :players is an array of hashes and uses keys.
  
  game_hash.each do |place, team|
  # Iterate through and top level. Don't care what the return value is so don't use .collect.
  
    team.each do |attribute, _data|
      next unless attribute == :players
      # Iterate through team and move onto the next block unless it's :players.

      game_hash[place][attribute].each do |player|
      # Iterate through the data in :players.
      
        next unless player[:player_name] == player_name
        # Move on to the next block unless the value for :player_name (inside :players) matches tht passed in player name.
        
        new_hash = player.delete_if do |k, _v|
          k == :player_name
          # Sets player (represents all the attributes in :players array of hashes once the player name matches) to new_hash.
          # In the new_hash, after checking the match (above) the player's name isn't needed in the final hash so .delete_if gets rid of it.
          
        end
      end
    end
  end
  new_hash
  # Returns the new hash.
  
end
=end



def big_shoe_rebounds
# Returns the number of rebounds of the player with the biggest shoe size

  biggest_shoe = 0
  num_rebounds = 0
  # Sets counters for biggest_shoe and num_rebounds.

  game_hash.each do |team, info|
  # Iterates through every single top level hash.
  
    info[:players].each do |player|
    # Iterate specifically through :players array of hashes (which is inside info).
    
      if player[:shoe] > biggest_shoe
      # If the :shoe (inside player array of hashes) is bigger than biggest_shoe (on 0 during first iteration so it will definitely loop)
      
        biggest_shoe = player[:shoe]
        # Set the biggest_shoe variable to whatever that value was.
        
        num_rebounds = player[:rebounds]
        # Also set the num_rebounds variable to the corresponding :rebounds value for that :shoe
        
      end
    end
  end

  num_rebounds
  # Return the num_rebounds variable.
  
end



=begin
# # Bonus Questions

# # Since there are multiple bonus questions that ask me
# # to return the name of a player with the most of some stat, I can use the following methods
# # to DRY (don't repeat yourself) up my code.

def iterate_through_players_for(name, statistic)
  game_hash.each do |_team, game_data|
    game_data[:players].each do |player|
      return player[statistic] if player[:player_name] == name
    end
  end
end

def player_with_most_of(statistic)
  player_name = nil
  amount_of_stat = 0

  game_hash.each do |_team, game_data|
    game_data[:players].each do |player|
      if player[statistic].is_a? String
        if player[statistic].length > amount_of_stat
          amount_of_stat = player[statistic].length
          player_name = player[:player_name]
        end
      elsif player[statistic] > amount_of_stat
        amount_of_stat = player[statistic]
        player_name = player[:player_name]
      end
    end
  end

  player_name
end

def most_points_scored
  player_with_most_of(:points)
end

def winning_team
  # Set up a hash to keep track of the points scored by each team. This way, we
  # can iterate through each player, get their points scored, and increase the
  # count in the hash.

  scores = { 'Brooklyn Nets' => 0, 'Charlotte Hornets' => 0 }

  game_hash.each do |_team, game_data|
    game_data[:players].each do |player|
      scores[game_data[:team_name]] += iterate_through_players_for(player[:player_name], :points)
    end
  end

  scores.max_by { |_k, v| v }.first
end

def player_with_longest_name
  player_with_most_of(:player_name)
end

# # Super Bonus Question

def long_name_steals_a_ton?
  player_with_most_of(:steals) == player_with_most_of(:player_name)
end
=end