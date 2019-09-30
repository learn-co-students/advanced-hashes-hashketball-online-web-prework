def create_player(name, number, shoe, points, rebounds, assists, steals, blocks, slam_dunks)
  player = {
      :name => name,
      :number => number,
      :shoe => shoe,
      :points => points,
      :rebounds => rebounds,
      :assists => assists,
      :steals => steals,
      :blocks => blocks,
      :slam_dunks => slam_dunks
  }
  player
end

def game_hash
  game = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        create_player("Alan Anderson", 0, 16, 22, 12, 12, 3, 1, 1), 
        create_player("Reggie Evans", 30, 14, 12, 12, 12, 12, 12, 7),
        create_player("Brook Lopez", 11, 17, 17, 19, 10, 3, 1, 15),
        create_player("Mason Plumlee", 1, 19, 26, 11, 6, 3, 8, 5),
        create_player("Jason Terry", 31, 15, 19, 2, 2, 4, 11, 1)
        ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        create_player("Jeff Adrien", 4, 18, 10, 1, 1, 2, 7, 2),
        create_player("Bismack Biyombo", 0, 16, 12, 4, 7, 22, 15, 10),
        create_player("DeSagna Diop", 2, 14, 24, 12, 12, 4, 5, 5),
        create_player("Ben Gordon", 8, 15, 33, 3, 2, 1, 1, 0),
        create_player("Kemba Walker", 33, 15, 6, 12, 12, 7, 5, 12)
        ]
    }
  }
end

def get_player_data(player_name, which_data)
  game_hash.each do |(key, value)|
    value[:players].each do |player|
      if player_name == player[:name]
        return player[which_data]
      end
    end
  end
  nil
end

def num_points_scored(name)
  get_player_data(name, :points)
end

def shoe_size(name)
  get_player_data(name, :shoe)
end

def team_colors(team_name)
  game_hash.each do |(location, team_data)|
    if team_data[:team_name] == team_name
      return team_data[:colors]
    end
  end
  nil
end

def team_names
  game_hash.reduce([]) { |names_of_teams, (location, team_data)|
    names_of_teams << team_data[:team_name] 
  }
end

def player_numbers(team_name)
  
  correct_team = game_hash.find do |(location, team_data)|
    team_data[:team_name] == team_name
  end
  correct_team[1][:players].reduce([]) do |jersey_numbers, player|
    jersey_numbers << player[:number]
  end
end

def player_stats(player_name)
  game_hash.each do |(location, team_data)|
    player = team_data[:players].find do |player_data|
      player_data[:name] == player_name
    end
    if player
      return player.reduce({}) do |stats, (key, value)|
        if key != :name
          stats[key] = value
        end
        stats
      end
    end
  end
  nil
end

def biggest(array, stat)
  if stat == :name
    array.max{ |a,b| a[:name].length <=> b[:name].length }
  else
    array.max{ |a,b| a[stat] <=> b[stat] }
  end
end

def biggest_both_teams(stat)
  game = game_hash
  biggest([biggest(game[:home][:players], stat), biggest(game[:away][:players], stat)], stat )
end

def big_shoe_rebounds
  biggest_both_teams(:shoe)[:rebounds]
end

def most_points_scored
  biggest_both_teams(:points)[:name]
end
def winning_team
  winner = game_hash.reduce({}) do |team, (location, team_data)| 
    total_points = team_data[:players].reduce(0){ |total, player|
      total += player[:points]
    }
    current_team = {
      :team_name => team_data[:team_name], 
      :points => total_points
      
    }
    if winner === nil
      winner = current_team
    else
    winner = biggest( [winner, current_team], :points)
    end
    winner
  end
  winner[:team_name]
end

def player_with_longest_name
  biggest_both_teams(:name)[:name]
end

def long_name_steals_a_ton?
  biggest_both_teams(:steals)[:name] == player_with_longest_name
end