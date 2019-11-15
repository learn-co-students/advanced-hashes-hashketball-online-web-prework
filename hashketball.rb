require 'pp'

def game_hash
  game_hash =
  {
    :home =>
    {
      :team_name => 'Brooklyn Nets',
      :colors => ['Black', 'White'],
      :players =>
      [
        {
          :player_name => 'Alan Anderson',
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        {
          :player_name => 'Reggie Evans',
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        {
          :player_name => 'Brook Lopez',
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        {
          :player_name => 'Mason Plumlee',
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 11,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        {
          :player_name => 'Jason Terry',
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      ]
    },
    :away =>
    {
      :team_name => 'Charlotte Hornets',
      :colors => ['Turquoise', 'Purple'],
      :players =>
      [
        {
          :player_name => 'Jeff Adrien',
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        {
          :player_name => 'Bismack Biyombo',
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 22,
          :blocks => 15,
          :slam_dunks => 10
        },
        {
          :player_name => 'DeSagna Diop',
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        {
          :player_name => 'Ben Gordon',
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        {
          :player_name => 'Kemba Walker',
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 7,
          :blocks => 5,
          :slam_dunks => 12
        }
      ]     
    }
  }
  game_hash
end

def biggest(stat)
  size = 0
  biggest = nil
  game_hash.each do
    |(team_key, team_value)|
    team_value[:players].each do
      |player|
      if player[stat] > size
        size = player[stat]
        biggest = player[:player_name]
      end
    end
  end
  biggest
end

def biggest_shoe
  biggest(:shoe)
end

def most_points_scored
  biggest(:points)
end

def player_with_longest_name
  size = 0
  longest_name = ''
  game_hash.each do
    |(team_key, team_value)|
    team_value[:players].each do
      |player|
      if player[:player_name].size > size
        size = player[:player_name].size
        longest_name = player[:player_name]
      end
    end
  end
  longest_name
end

def player_stats(player_name, include_name = false)
  game_hash.each do
    |(team_key, team_value)|
    team_value[:players].each do
      |player|
      if player[:player_name] == player_name
        if not include_name
          player.delete(:player_name)
        end
        return player
      end
    end
  end
  nil
end


def get_player_value(player_name, key)
  player = player_stats(player_name, true)
  if player != nil
    return player[key]
  end
  nil
end

def num_points_scored(player_name)
  get_player_value(player_name, :points)
end

def shoe_size(player_name)
  get_player_value(player_name, :shoe)
end

def big_shoe_rebounds
  get_player_value(biggest_shoe, :rebounds)
end

def long_name_steals_a_ton?
  long_name = player_with_longest_name
  stealer = biggest(:steals)
  if long_name == stealer
    return true
  end
  false
end

def get_team_value(team_name, key)
  game_hash.each do
    |(team_key, team_value)|
    if team_value[:team_name] == team_name
      return team_value[key]
    end
  end
  nil
end

def team_colors(team_name)
  get_team_value(team_name, :colors)
end

def player_numbers(team_name)
  players = get_team_value(team_name, :players)
  player_numbers = []
  players.each do
    |player|
    player_numbers += [player[:number]]
  end
  player_numbers
end

def team_names
  team_names = []
  game_hash.each do
    |(team_key, team_value)|
    team_names += [team_value[:team_name]]
  end
  team_names
end

def team_score(team_name)
  team_score = 0
  players = get_team_value(team_name, :players)
  players.each do
    |player|
    team_score += player[:points]
  end
  team_score
end

def winning_team
  (team1, team2) = team_names
  score1 = team_score(team1)
  score2 = team_score(team2)
  if score1 > score2
    return team1
  else
    return team2
  end
end