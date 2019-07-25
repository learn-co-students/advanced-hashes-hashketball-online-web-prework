require 'pry'

def game_hash
  {:home=>
    {:team_name=>"Brooklyn Nets",
     :colors=>["Black", "White"],
     :players=>
      [{"Alan Anderson"=> {
        :number=>0,
        :shoe=>16,
        :points=>22,
        :rebounds=>12,
        :assists=>12,
        :steals=>3,
        :blocks=>1,
        :slam_dunks=>1}},
       {"Reggie Evans"=>{
        :number=>30,
        :shoe=>14,
        :points=>12,
        :rebounds=>12,
        :assists=>12,
        :steals=>12,
        :blocks=>12,
        :slam_dunks=>7}},
       {"Brook Lopez"=>{
        :number=>11,
        :shoe=>17,
        :points=>17,
        :rebounds=>19,
        :assists=>10,
        :steals=>3,
        :blocks=>1,
        :slam_dunks=>15}},
       {"Mason Plumlee"=>{
        :number=>1,
        :shoe=>19,
        :points=>26,
        :rebounds=>11,
        :assists=>6,
        :steals=>3,
        :blocks=>8,
        :slam_dunks=>5}},
       {"Jason Terry"=>{
        :number=>31,
        :shoe=>15,
        :points=>19,
        :rebounds=>2,
        :assists=>2,
        :steals=>4,
        :blocks=>11,
        :slam_dunks=>1}}]},
   :away=>
    {:team_name=>"Charlotte Hornets",
     :colors=>["Turquoise", "Purple"],
     :players=>
      [{"Jeff Adrien"=>{
        :number=>4,
        :shoe=>18,
        :points=>10,
        :rebounds=>1,
        :assists=>1,
        :steals=>2,
        :blocks=>7,
        :slam_dunks=>2}},
       {"Bismack Biyombo"=>{
        :number=>0,
        :shoe=>16,
        :points=>12,
        :rebounds=>4,
        :assists=>7,
        :steals=>22,
        :blocks=>15,
        :slam_dunks=>10}},
       {"DeSagna Diop"=>{
        :number=>2,
        :shoe=>14,
        :points=>24,
        :rebounds=>12,
        :assists=>12,
        :steals=>4,
        :blocks=>5,
        :slam_dunks=>5}},
       {"Ben Gordon"=>{
        :number=>8,
        :shoe=>15,
        :points=>33,
        :rebounds=>3,
        :assists=>2,
        :steals=>1,
        :blocks=>1,
        :slam_dunks=>0}},
       {"Kemba Walker"=>{
        :number=>33,
        :shoe=>15,
        :points=>6,
        :rebounds=>12,
        :assists=>12,
        :steals=>7,
        :blocks=>5,
        :slam_dunks=>12}}]}}

end

def home_players
  game_hash[:home][:players]
end

def any_player name
  #returns {name => {stats}}
  player_home = game_hash[:home][:players].select {|hash| hash.keys.first == name}
  player_away = game_hash[:away][:players].select {|hash| hash.keys.first == name}
  player = player_home.first || player_away.first
end

def num_points_scored name
  any_player(name)[name][:points]
end

def shoe_size name
  any_player(name)[name][:shoe]
end

def team_colors team_name
  game_hash[:home][:team_name] == team_name ?
    game_hash[:home][:colors] :
    game_hash[:away][:colors]
end

def team_names
  game_hash.values.map {|t| t[:team_name]}
end

def player_numbers team_name
  team = game_hash.values.filter {|t| t[:team_name] == team_name}
  team.first[:players].map {|hash| hash.values.first.fetch :number}
end

def player_stats player
  any_player(player)[player]
end

def players
  #returns an array of all players
  game_hash[:home][:players] | game_hash[:away][:players]
end

def largest_shoe_size
  players.reduce(0) do |memo, item|
    shoe = item.values.first.fetch :shoe
    shoe >= memo ? shoe : memo
  end
end

def player_with_largest_shoe
  player = players.select do |hash|
    largest_shoe_size == hash.values.first.fetch(:shoe)
  end

  return player.first.keys.first
end

def player_rebounds player
  any_player(player)[player][:rebounds]
end

def big_shoe_rebounds
  player_rebounds player_with_largest_shoe
end

def highest_points
  players.reduce(0) do |memo, item|
    points = item.values.first.fetch :points
    points >= memo ? points : memo
  end
end

def most_points_scored
  player = players.select do |hash|
    highest_points == hash.values.first[:points]
  end
  player.first.keys.first
end

def winning_team
  home_team_scores = game_hash[:home][:players].map {|p| p.values.first.fetch :points}
  away_team_scores = game_hash[:away][:players].map {|p| p.values.first.fetch :points}
  home = home_team_scores.reduce(:+)
  away = away_team_scores.reduce(:+)

  if home > away
    game_hash[:home][:team_name]
  elsif away > home
    game_hash[:away][:team_name]
  end
end


def player_with_longest_name
  players.reduce("") do |memo, item|
    name = item.keys.first
    name.size >= memo.size ? name : memo
  end
end

def player_with_most_steals
  player = players.reduce(["nil", 0]) do |memo, item|
    name = item.keys.first
    steals = item.values.first.fetch :steals

    memo[1] <= steals ? [name, steals] : memo
  end
  player[0]
end

def long_name_steals_a_ton?
  player_with_most_steals == player_with_longest_name
end
