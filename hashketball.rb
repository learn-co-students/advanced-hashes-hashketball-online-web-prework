def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson": {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans": {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez": {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee": {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry": {
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
        "Jeff Adrien": {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo": {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop": {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon": {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood": {
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
  return game_hash
end

def num_points_scored(name)
  game_hash.each do |locale, team|
    team.each do |key, value|
      if key.to_s == 'players'
        value.each do |player, stat|
          if name == player.to_s
            stat.each do |attribute, total|
              if attribute == :points
                return total
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |locale, team|
    team.each do |key, value|
      if key == :players
        value.each do |player, stat|
          if name == player.to_s
            stat.each do |attribute, total|
              if attribute == :shoe
                return total
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(nom_de_team)
  game_hash.each do |locale, team|
    team.each do |key, value|
      if key == :team_name && value == nom_de_team
        team.each do |key2, value2|
          if key2 == :colors
            return value2
          end
        end
      end
    end
  end
end

team_colors("Charlotte Hornets")

def team_names
  teams = []
  game_hash.each do |locale, team|
    team.each do |key, value|
      if key == :team_name
        teams << value
      end
    end
  end
  return teams
end

def player_numbers(team_no_namae)
  jersey_numbers = []
  game_hash.each do |locale, team|
    team.each do |key, value|
      if key == :players
        value.each do |player, stat|
          stat.each do |attribute, number|
            if attribute == :number
              jersey_numbers << number
            end
          end
        end
      end
    end
  end
  return jersey_numbers
end

def player_numbers(team_no_namae)
  jersey_numbers = []
  game_hash.each do |locale, team|
    team.each do |key, value|
      if key == :team_name && team_no_namae == value
        team.each do |key2, value2|
          if key2 == :players
            value2.each do |player, stat|
              stat.each do |attribute, total|
                if attribute == :number
                  jersey_numbers << total
                end
              end
            end
          end
        end
      end
    end
  end
  return jersey_numbers
end

def player_stats(name)
  return_stats = {}
  game_hash.each do |locale, team|
    team.each do |key, value|
      if key == :players
        value.each do |player, stat|
          if player.to_s == name
            stat.each do |attribute, total|
              return_stats[attribute] = total
            end
          end
        end
      end
    end
  end
  return return_stats
end

def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each do |locale, team|
    team.each do |key, value|
      if key == :players
        value.each do |player, stat|
          stat.each do |attribute, total|
            if attribute == :shoe && biggest_shoe < total
              biggest_shoe = total
              stat.each do |attribute2, total2|
                if attribute2 == :rebounds
                  rebounds = total2
                end
              end 
            end
          end
        end
      end
    end
  end
  return rebounds
end









