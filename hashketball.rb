# Write your code here!

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets" ,
      :colors => ["Black", "White"] ,
      :players => [
         {"Alan Anderson" =>  {
            :number =>0 ,
            :shoe =>16 ,
            :points => 22,
            :rebounds => 12 ,
            :assists =>12 ,
            :steals => 3 ,
            :blocks => 1 ,
            :slam_dunks => 1 ,
          }
           
         },
          
         {"Reggie Evans" => {
            :number =>30 ,
            :shoe =>14 ,
            :points => 12,
            :rebounds => 12 ,
            :assists =>12 ,
            :steals => 12 ,
            :blocks => 12 ,
            :slam_dunks => 7 ,
          }
           
         },
          
         {"Brook Lopez" =>  {
            :number =>11 ,
            :shoe =>17 ,
            :points => 17,
            :rebounds => 19 ,
            :assists =>10 ,
            :steals => 3 ,
            :blocks => 1 ,
            :slam_dunks => 15 ,
          }
           
         },
          
         {"Mason Plumlee" =>{
            :number =>1 ,
            :shoe =>19 ,
            :points => 26,
            :rebounds => 11 ,
            :assists =>6 ,
            :steals => 3 ,
            :blocks => 8 ,
            :slam_dunks => 5 ,
          } 
           
         } ,
          
         {"Jason Terry" =>{
            :number =>31 ,
            :shoe =>15 ,
            :points => 19,
            :rebounds => 2 ,
            :assists =>2 ,
            :steals => 4 ,
            :blocks => 11 ,
            :slam_dunks => 1 ,
          } 
           
         } 
        ]
    },
    :away => {
      :team_name =>"Charlotte Hornets" ,
      :colors => ["Turquoise","Purple"] ,
      :players => [
        
           {"Jeff Adrien" =>  {
            :number =>4 ,
            :shoe =>18 ,
            :points => 10,
            :rebounds => 1 ,
            :assists =>1 ,
            :steals => 2 ,
            :blocks => 7 ,
            :slam_dunks => 2 ,
          }
             
           },
          
          {"Bismack Biyombo" => {
            :number =>0 ,
            :shoe =>16 ,
            :points => 12,
            :rebounds => 4 ,
            :assists =>7 ,
            :steals => 22 ,
            :blocks => 15 ,
            :slam_dunks => 10 ,
          }
            
          },
          
          {"DeSagna Diop" => {
            :number =>2 ,
            :shoe =>14 ,
            :points => 24,
            :rebounds => 12 ,
            :assists =>12 ,
            :steals => 4 ,
            :blocks => 5 ,
            :slam_dunks => 5 ,
          }
            
          },
          
          {"Ben Gordon" => {
            :number =>8 ,
            :shoe =>15 ,
            :points => 33,
            :rebounds => 3 ,
            :assists =>2 ,
            :steals => 1 ,
            :blocks => 1 ,
            :slam_dunks => 0 ,
          }
            
          },
          
          {"Kemba Walker" => {
            :number =>33 ,
            :shoe =>15 ,
            :points => 6,
            :rebounds => 12 ,
            :assists =>12 ,
            :steals => 7 ,
            :blocks => 5 ,
            :slam_dunks => 12 ,
          }
            
          }
        ]
    }
  
  }
  
  hash
end


def num_points_scored(player_name)
  
  result = nil
  game_hash[:home][:players].each do |el|
    el.each do |key, val|
      if key == player_name
         result = val[:points]
      end
   
    end
  end

   game_hash[:away][:players].each do |el|
    el.each do |key, val|
      if key == player_name
        result = val[:points]
      end
   
    end
  end

  result
 
end

def shoe_size(player_name)
  hash = game_hash
   result = nil
  game_hash[:home][:players].each do |el|
    el.each do |key, val|
      if key == player_name
         result = val[:shoe]
      end
   
    end
  end

   game_hash[:away][:players].each do |el|
    el.each do |key, val|
      if key == player_name
        result = val[:shoe]
      end
   
    end
  end

  result
end

def team_colors(team_name)
        hash =  game_hash
          if hash[:home][:team_name] ==team_name
        array = hash[:home][:colors]
      end

      if hash[:away][:team_name] == team_name
      array = hash[:away][:colors]
      end
      array
end


def team_names
  game_hash
  array = []
  array.push(game_hash[:home][:team_name])
  array.push(game_hash[:away][:team_name])
  array
end

def player_numbers(team_name)
  hash = game_hash
    array = []
if hash[:home][:team_name] == team_name
  hash[:home][:players].each do |el|
    el.each do |key,val|
      array.push(val[:number])
  
    end
  end
end
if hash[:away][:team_name] == team_name
  hash[:away][:players].each do |el|
    el.each do |key,val|
      array.push(val[:number])
  
    end
  end
end
array.sort 
end

def player_stats(player_name)
  hash = game_hash
   result = {}
  game_hash[:home][:players].each do |el|
    el.each do |key, val|
      if key == player_name
         result = val
      end
   
    end
  end

   game_hash[:away][:players].each do |el|
    el.each do |key, val|
      if key == player_name
        result = val
      end
   
    end
  end

  result
end

def big_shoe_rebounds
  hash = game_hash
   array = []
result =0
  hash[:home][:players].each do |el|
    el.each do |key, val|
     array.push(val[:shoe])
    end
  end

  hash[:away][:players].each do |el|
    el.each do |key, val|
     array.push(val[:shoe])
    end
  end
  #====================================
  #====================================
 array =  array.sort
 array.last

 hash[:home][:players].each do |el|
   el.each do |key,val|
    if val[:shoe] == array.last
        result= val[:rebounds]
    end
   end
 end


 hash[:away][:players].each do |el|
   el.each do |key,val|
    if val[:shoe] == array.last
        result= val[:rebounds]
    end
   end
 end
 result
end

def most_points_scored
   hash = game_hash
   array = []
result =""
  hash[:home][:players].each do |el|
    el.each do |key, val|
     array.push(val[:points])
    end
  end

  hash[:away][:players].each do |el|
    el.each do |key, val|
     array.push(val[:points])
    end
  end
  #====================================
  #====================================
 array =  array.sort
 array.last

 hash[:home][:players].each do |el|
   el.each do |key,val|
    if val[:points] == array.last
        result= key
    end
   end
 end


 hash[:away][:players].each do |el|
   el.each do |key,val|
    if val[:points] == array.last
        result= key
    end
   end
 end
 result
end


def winning_team
  hash = game_hash
   total_for_home = 0 
  total_for_away = 0
  
result =""
  hash[:home][:players].each do |el|
   el.each do |key, val|
    total_for_home += val[:points]
   end

 end

  hash[:away][:players].each do |el|
   el.each do |key, val|
    total_for_away += val[:points]
   end

 end

 if total_for_away > total_for_home
  result  =hash[:away][:team_name]
  else
  result = hash[:home][:team_name]
 end 
 result
end


def player_with_longest_name 
  hash = game_hash
  array = []
result =""
  hash[:home][:players].each do |el|
   el.each do |key, val|
     array.push(key.length)
   end

 end

  hash[:away][:players].each do |el|
   el.each do |key, val|
    array.push(key.length)
   end

 end
 array = array.sort
 #========================
 #========================
   hash[:home][:players].each do |el|
   el.each do |key, val|
     if key.length == array.last
      result = key
     end
   end

 end

  hash[:away][:players].each do |el|
   el.each do |key, val|
    if key.length == array.last
      result = key
    end
   end

 end

 
 result
end

def long_name_steals_a_ton?
  name = player_with_longest_name
   hash = game_hash
   array = []

  hash[:home][:players].each do |el|
    el.each do |key, val|
     array.push(val[:steals])
    end
  end

  hash[:away][:players].each do |el|
    el.each do |key, val|
     array.push(val[:steals])
    end
  end
  #====================================
  #====================================
 array =  array.sort
 array.last

  
   hash[:away][:players][1].each do |key, val|
      if val[:steals] == array.last
        return true
      end
   end

end





