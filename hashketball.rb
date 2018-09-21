# Write your code here!
def game_hash
game_hash = {
     :home => {
     :team_name => 'Brooklyn Nets',
    :colors => ['black', 'white'],
    :players => [
      {player_name: 'Alan Anderson', number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
      {player_name: 'Reggie Evans', number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
      {player_name: 'Brook Lopez', number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
      {player_name: 'Mason Plumlee', number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
      {player_name: 'Jason Terry', number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      ]
    },
   :away => {
     :team_name => 'Charlotte Hornets',
    :colors => ['turquoise', 'purple'],
    :players => [
      {player_name: 'Jeff Adrien', number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
      {player_name: 'Bismak Biyombo', number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
      {player_name: 'DeSagna Diop', number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
      {player_name: 'Ben Gordon', number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
      {player_name: 'Brendan Haywood', number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      ]
    }
  }
  return game_hash
end

def num_points_scored(player)
  game_hash.each do |home_away, keys|
    keys[:players].each do |player1|
      return player1[:points] if player1[:player_name] == player
    end
  end
end
  
def shoe_size(player)
  game_hash.each do |home_away, keys|
    keys[:players].each do |player1|
      return player1[:shoe] if player1[:player_name] == player
    end
  end
end

def team_colors(team)
  game_hash.each do |home_away, keys|
   if keys[:team_name] == team
      return keys[:colors].map(&:capitalize)
    end
  end
end

def team_names
  game_hash.map {|home_away, keys| keys[:team_name]}
end

def player_numbers(team)
  numArray = []
 game_hash.each {|home_away, keys| 
  if keys[:team_name] == team 
   return keys[:players].map {|player| player[:number]}
  end
 }
end

def player_stats(player)
  game_hash.each {|home_away, keys|
     keys[:players].each {|key, value| 
        if key[:player_name] == player
           key.delete(:player_name)
           return key
        end
     }
  }
end

def big_shoe_rebounds
  bigShoeGuy = ""
  biggestShoe = "1"
  game_hash.each {|home_away, keys|
    keys[:players].each { |playerInfo|
    puts playerInfo
      if playerInfo[:shoe] > biggestShoe.to_i
        biggestShoe = playerInfo[:shoe_size].to_s
        bigShoeGuy = playerInfo[:player_name]
      end
    }
  }
  return player_stats(bigShoeGuy)[:rebounds]
end

big_shoe_rebounds()

