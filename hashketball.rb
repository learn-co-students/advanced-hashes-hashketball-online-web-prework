require "pry"
def game_hash
  {
    away: { 
      team_name: 'Charlotte Hornets',
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
    home: { 
      team_name: 'Brooklyn Nets',
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
      ]
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |location, team_data| 
    team_data[:players].each do |player| 
      if player[:player_name] == player_name
      return player[:points]
      end 
    end 
    
  end 
 end 
 
 
 def shoe_size(player_name)
  game_hash.each do |location, team_info|
    team_info[:players].each do |player|
      return player[:shoe] if player[:player_name] == player_name
    end
  end
end


def team_colors(team)
  game_hash.each do |location, team_info|
    team_info.each do |attribute, data|
      return game_hash[location][:colors] if data == team
    end
  end
end


def team_names
  names = [] 
  game_hash.each do |location, team_info|
    team_info.each do |attribute, data|
      if attribute == :team_name
        names << data
      end
    end
  end
names
end


def player_numbers(team)
    numbers  = []
    game_hash.each do |key, values|
      if values[:team_name] == team 
        values[:players].collect do |players|
          numbers << players[:number]
          end
      end
  end
  numbers
end

=begin
iterate over game_hash
once we iterate we want to check 
if the team_name equal the argument of team name
if team name matches the argument the iterate over that team information to grab each player data
query the player data using braket notation to get the jersey number 
and shovel or push to empty Array
return empty array
=end


def player_stats(player_name)
  game_hash.each do |location, team_info| 
    team_info[:players].each do |player|
    if player[:player_name] == player_name
       player.delete(:player_name)
       return player 
     end 
   end 
 end 
end  
  


def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0

  game_hash.each do |location, team_info|
    team_info[:players].each do |player|
      if player[:shoe] > biggest_shoe
        biggest_shoe = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  rebounds
end


def most_points_scored
 player = ""
  most_points = 0

  game_hash.each do |location, team_info|
    team_info.each do |attribute, data|
      if attribute.to_s == "players"
        data.each do |current_player|
          if current_player[:points] > most_points
            most_points = current_player[:points]
            player = current_player[:player_name]
          end
      end
    end
  end
end
  player 
end 


def winning_team
  new_hash = {}
  game_hash.each do |team, team_info|
    new_hash[team_info[:team_name]] = team_info[:players].map do |player|
      player[:points] 
      end.inject(0){|sum,num| sum + num }
    end
    new_hash.sort[0][0]
end


def player_with_longest_name
  long_name = ""
  game_hash.each do |team, team_info|
    team_info[:players].each do |player|
      if player[:player_name].length > long_name.length
        long_name = player[:player_name]
      end 
    end 
  end 
  return long_name
end 



def long_name_steals_a_ton?
    "100 very true!"
    return true
end
  

 





