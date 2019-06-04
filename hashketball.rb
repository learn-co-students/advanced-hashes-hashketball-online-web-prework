# Write your code here!
require 'pry'
def game_hash
  {
    "home": {
      "team_name": "Brooklyn Nets",
      "colors": ["Black", "White"],
      "players": {
        "Alan Anderson": {
          "number": "0",
          "shoe": "16",
          "points": "22",
          "rebounds": "12",
          "assists": "12",
          "steals": "3",
          "blocks": "1",
          "slam_dunks": "1"
        },
        "Reggie Evans": {
          "number": "30",
          "shoe": "14",
          "points": "12",
          "rebounds": "12",
          "assists": "12",
          "steals": "12",
          "blocks": "12",
          "slam_dunks": "7"
        },
        "Brook Lopez": {
          "number": "11",
          "shoe": "17",
          "points": "17",
          "rebounds": "19",
          "assists": "10",
          "steals": "3",
          "blocks": "1",
          "slam_dunks": "15"
        },
        "Mason Plumlee": {
          "number": "1",
          "shoe": "19",
          "points": "26",
          "rebounds": "12",
          "assists": "6",
          "steals": "3",
          "blocks": "8",
          "slam_dunks": "5"
        },
        "Jason Terry": {
          "number": "31",
          "shoe": "15",
          "points": "19",
          "rebounds": "2",
          "assists": "2",
          "steals": "4",
          "blocks": "11",
          "slam_dunks": "1"
        }
      }
    },
    "away": {
      "team_name": "Charlotte Hornets",
      "colors": ["Turquoise", "Purple"],
      "players": {
        "Jeff Adrien": {
          "number": "4",
          "shoe": "18",
          "points": "10",
          "rebounds": "1",
          "assists": "1",
          "steals": "2",
          "blocks": "7",
          "slam_dunks": "2"
        },
        "Bismack Biyombo": {
          "number": "0",
          "shoe": "16",
          "points": "12",
          "rebounds": "4",
          "assists": "7",
          "steals": "22",
          "blocks": "15",
          "slam_dunks": "10"
        },
        "DeSagna Diop": {
          "number": "2",
          "shoe": "14",
          "points": "24",
          "rebounds": "12",
          "assists": "12",
          "steals": "4",
          "blocks": "5",
          "slam_dunks": "5"
        },
        "Ben Gordon": {
          "number": "8",
          "shoe": "15",
          "points": "33",
          "rebounds": "3",
          "assists": "2",
          "steals": "1",
          "blocks": "1",
          "slam_dunks": "0"
        },
        "Kemba Walker": {
          "number": "33",
          "shoe": "15",
          "points": "6",
          "rebounds": "12",
          "assists": "12",
          "steals": "7",
          "blocks": "5",
          "slam_dunks": "12"
        }
      }
    }
  }
end

# puts game_hash
my_player = "Alan Anderson"
my_player2 = "Ben Gordon"

def num_points_scored(player)
   # Access first level of hash
  game_hash.each do |location, team_data|
    # Access second level of hash
        team_data.each do |attribute, data|

      # Test condition for player object
      if attribute == :players

        # Test condition for player name
        if data.keys.include?(player.to_sym)
          # return the player score
            return data[player.to_sym]["points".to_sym].to_i
        end
      end
    end
  end
end


def shoe_size(player)
   # Access first level of hash
  game_hash.each do |location, team_data|
    # Access second level of hash
        team_data.each do |attribute, data|

      # Test condition for player object
      if attribute == :players

        # Test condition for player name
        if data.keys.include?(player.to_sym)
          # return the player score

              return data[player.to_sym]["shoe".to_sym].to_i
        end
      end
    end
  end
end


def team_colors(team)
   result = nil
  # Access first level of hash
  game_hash.each do |location, team_data|
    # Access second level of hash
    # Test condition for team
    if team_data[:team_name] == team
      # update result variable
      result = team_data[:colors]
    end
  end
  result
end


def team_names
   # Access first level of hash
  game_hash.collect do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team)
   result = []
  # Access first level of hash
  game_hash.collect do |location, team_data|
    # control for the correct team
    if team_data[:team_name] == team
      # return the players for team

      team_data[:players].each do |player|
        result << player[1][:number].to_i
      end
    end
  end
  result
end

# puts player_numbers("Brooklyn Nets")

def player_stats(arg)
   result = {}
  # Access first level of hash
  game_hash.each do |location, team_data|
    team_data[:players].collect do |player, data|
      if player == arg.to_sym
        # puts "You have the player!"
        data.each do |item, value|

              data[item] = value.to_i

            end
        result = data
      end
    end
  end
  result
end


# puts player_stats("Jeff Adrien")

def big_shoe_rebounds
  result = nil
  # First, get player with biggest shoe
  player_name = nil # symbol
  game_hash.each do |loc, team_data|
    # shoe size comparison variable
    player_size = nil
    team_data[:players].each do |player, info|
      if player_size == nil || player_size < info[:shoe].to_i
        player_size = info[:shoe].to_i
        player_name = player
      end
    end
    # Second, get the number of rebounds for player with biggest shoe
    team_data[:players].each do |person, stats|
      # Upate result variable
      result = stats[:rebounds].to_i if person == player_name
    end
    # Return the results
    return result
  end
end

# puts big_shoe_rebounds

def most_points_scored
  result = nil
  # First, get player with most points
  player_name = nil # symbol

  game_hash.each do |loc, team_data|
    # points comparison variable
    points = nil
    team_data[:players].each do |player, info|
      if points == nil || points < info[:points].to_i
        points = info[:points].to_i
        player_name = player
      end
    end
        # Second, get the number of rebounds for player with biggest shoe
    # team_data[:players].each do |person, stats|
      # Upate result variable
      # result = stats[:rebounds].to_i if person == player_name
    # end
    # Return the results
    # return result
  end
  player_name.to_s
end

# puts most_points_scored

def winning_team
  home_team_score = 0
  home_team_name = nil # symbol

  away_team_score = 0
  away_team_name = nil # symbol

  game_hash.each do |loc, team_data|
    # Assign teams
    if loc == :home
        home_team_name = team_data[:team_name]
    else
        away_team_name = team_data[:team_name]
    end
    # Iterate through stats to find collect points for team
    team_data[:players].each do |player, stats|
        # loc == :home ? puts "home team" : puts "away team"
        if loc == :home
            home_team_score += stats[:points].to_i
        else
            away_team_score += stats[:points].to_i
        end
    end
  end
  # Compare team points
  # return winning team
  home_team_score > away_team_score ? home_team_name.to_s : away_team_name.to_s
end

# puts winning_team

def player_with_longest_name
    player = ""
    game_hash.each do |loc, team_data|
    team_data[:players].keys.each do |item|
        player = item.to_s if item.to_s.length > player.length
    end
  end
    player

end

# puts player_with_longest_name

def long_name_steals_a_ton?
    player_long_name = player_with_longest_name()
    player_long_name_steals = 0
    all_other_steals = []
    result = nil
    game_hash.each do |loc, team_data|
        team_data[:players].each do |player, stats|
            # puts player

            if player == player_long_name.to_sym
                # player_long_name_steals for longest name platers
                player_long_name_steals = stats[:steals].to_i
            else
                # Add player steals to all_other_steals
                all_other_steals << stats[:steals].to_i
            end
        end
    end

    # Iterate over all_other_steals comparing player_long_name_steals
    all_other_steals.each_with_index do |item, i|
        if item > player_long_name_steals
            # We get in here, then the player doesn't have most steals
            return false
        else
            result = true
        end
    end
    result
end

# puts long_name_steals_a_ton?