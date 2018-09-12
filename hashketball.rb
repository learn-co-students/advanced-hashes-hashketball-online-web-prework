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
    },
  }
end

def num_points_scored player
  players = game_hash.values.collect {|team| team[:players]}.flatten
  players.reduce(&:merge)[player][:points]
end

def shoe_size player
  players = game_hash.values.collect {|team| team[:players]}.flatten
  players.reduce(&:merge)[player][:shoe]
end

def team_colors team_name
  game_hash.values.find {|team| team[:team_name] == team_name}[:colors]
end

def team_names
  game_hash.values.collect {|team| team[:team_name]}
end

def player_numbers team_name
  team = game_hash.values.find{|team| team[:team_name] == team_name}
  team[:players].values.collect {|player| player[:number]}
end

def player_stats player
  game_hash.values.collect {|team| team[:players]}.flatten.reduce(&:merge)[player]
end

def big_shoe_rebounds
  players = game_hash.values.collect {|team| team[:players]}.flatten.reduce(&:merge)
  players.max { |(a, as), (b, bs)| as[:shoe] <=> bs[:shoe] }[1][:rebounds]
end

def most_points_scored
  players = game_hash.values.collect {|team| team[:players]}.flatten.reduce(&:merge)
  players.max { |(a, as), (b, bs)| as[:points] <=> bs[:points] }[0]
end

def winning_team
  sum_points = ->(team) do
    team[:players].values.collect {|x| x[:points]}.reduce(:+)
  end
  game_hash.values.max_by(&sum_points)[:team_name]
end

def player_with_longest_name
  players = game_hash.values.collect {|team| team[:players]}.flatten.reduce(&:merge)
  players.keys.max_by(&:size)
end

def long_name_steals_a_ton?
  players = game_hash.values.collect {|team| team[:players]}.flatten.reduce(&:merge)
  players.max_by {|n, s| s[:steals]}[0] == player_with_longest_name
end
