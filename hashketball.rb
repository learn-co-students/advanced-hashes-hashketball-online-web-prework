require 'pry'

def game_hash
  game_hash = {
   :home => {
         :team_name => "Brooklyn Nets",
         :colors => ['black', 'white'],
         :players => {
           'Alan Anderson': {
             number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
           'Reggie Evans': {
             number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
           'Brook Lopez': {
             number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
           'Mason Plumlee': {
             number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
           'Jason Terry': {
             number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
         },
      },
      :away => {
        :team_name => 'Charlotte Hornets',
        :colors => ['turquoise', 'purple'],
        :players => {
          'Jeff Adrien': {
            number: 4,
            shoe: 18,
            points: 10,
            rebounds: 1,
            assists: 1,
            steals: 2,
            blocks: 7,
            slam_dunks: 2
          },
          'Bismak Biyombo': {
            number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
          'DeSagna Diop': {
            number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
          'Ben Gordon': {
            number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
          'Brendan Haywood': {
            number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      }
    }
  }
  end

  def num_points_scored(player_name)
    game_hash.each do |locations, attributes|
      attributes[:players].each do |name, details|
        return details[:points] if name.to_s == player_name
      end
    end
  end

def shoe_size(player_name)
  game_hash.each do |locations, attributes|
    attributes[:players].each do |name, spec|
      return spec[:shoe] if name.to_s == player_name
    end
  end
end

def team_colors(team_na)
  game_hash.each do |location, attributes|
    if attributes[:team_name].to_s == team_na
      arr = attributes[:colors]
      arr = arr.collect {|color| color.capitalize}
      return arr
  end
  end
end


def team_names
  arr = []
  game_hash.each do |location, attributes|
  arr << attributes[:team_name]
end
  return arr
end

def player_stats(player_name)
  game_hash.each do |location, attributes|
    attributes[:players].each do |name, spec|
      return spec if name.to_s == player_name
    end
  end
end

def player_numbers(team_na)
  arr = []
  game_hash.each do |location, attributes|
    if attributes[:team_name] == team_na
    attributes[:players].each do |name, spec|
      arr << spec[:number]
    end
  end
end
arr
end

def big_shoe_rebounds
  shoe_si = 0
  ansr = 0
  game_hash.each do |location, attributes|
    attributes[:players].each do |name, spec|
      if shoe_si < spec[:shoe]
        #binding.pry
        shoe_si = spec[:shoe]
        ansr = spec[:rebounds]
    end
  end
end
ansr
end
