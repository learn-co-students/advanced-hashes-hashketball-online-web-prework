# Write your code here!

def game_hash {
  :home => [
    {
  :team_name => "Brooklyn Nets"
  :colors => "Black, White"
  :players => ["Alan Anderson", "Reggie Evans", "Brook Lopez", "Mason Plumlee", "Jason Terry"]
  player_stats("Alan Anderson")
  => { :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
      }
  ]
  
}

end 


def game_hash {
  :away => [
    {
  :team_name => "Charlotte Hornets"
  :colors => "Turquoise, Purple"
  :players => ["Jeff Adrien", "Bismack Biyombo", "DeSagna Diop", "Ben Gordon", "Kemba Walker"]
  player_stats("Jeff Adrien")
  => { :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      }
  ]
  
}

end 








def home_team_name
  game_hash[:home][:team_name]
end
 
puts home_team_name







