require 'pry'

def game_hash 
  hash = {
    :home => {
      :team_name =>'Brooklyn Nets',
      :colors => ['Black','White',],
      :players => [{
        :player_name =>"Alan Anderson",
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
        :player_name => "Reggie Evans",
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
        :player_name => "Brook Lopez",
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
        :player_name => "Mason Plumlee",
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
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
      }]
    },
    :away => {
      :team_name =>'Charlotte Hornets',
      :colors => ['Turquoise','Purple',],
      :players => [{
        :player_name => "Jeff Adrien",
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
        :player_name => "Bismack Biyombo",
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
        :player_name => "DeSagna Diop",
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
        :player_name => "Ben Gordon",
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
        :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }]
    }
  }
  return hash
end

def players_data_array
  new_array = []
  game_hash.each do |team, hash|
    i = 0
    while i < hash[:players].length do
      new_array << hash[:players][i]
      i+= 1
      binding.pry
    end
  end
  new_array
end

def num_points_scored(player)
  #knows the number of points scored by each player
  return players_data_hash[player][:points]
end

def shoe_size(player)
  #knows the shoe size of each player
  return players_data_hash[player][:shoe]
end

def team_colors(team)
  #knows the Brooklyn Nets colors are Black and White
  if game_hash[:home][:team_name] == team
    return game_hash[:home][:colors]
  #elsif game_hash[:away].include?(team)
  else
    return game_hash[:away][:colors]
  end
end

def team_names
  #returns the team names in an array
  array = []
  array << game_hash[:home][:team_name]
  array << game_hash[:away][:team_name]
  return array
end

def player_numbers(team)
  #returns the player jersey numbers
  numbers = []
  if game_hash[:home][:team_name] == team
    i = 0
    while i < game_hash[:home][:players].length do
      numbers << game_hash[:home][:players][i][:number]
      i += 1
    end
  #elsif game_hash[:away].include?(team)
  else
    i = 0
    while i < game_hash[:away][:players].length do
      numbers << game_hash[:away][:players][i][:number]
      i += 1
    end
  end
  return numbers
end

def player_stats(player)
  #returns all stats for a given player
    return players_data_hash[player].delete_if {|key, value| key == :player_name }
end

def big_shoe_rebounds
  #returns the number of rebounds of the player with the biggest shoe size
  #shoe_size_hash = {player => shoe size (int) }
  
  player_with_largest_shoe = players_data_array[0]
  i = 0 
  while i < players_data_array.length do
    if players_data_array[i][:shoe] > player_with_largest_shoe[:shoe]
      player_with_largest_shoe = players_data_array[i]
    end
    i += 1 
  end
  player_with_largest_shoe[:rebounds]
end


#defining a method to rearrange the data so as not to include the teams.
#new_hash = {"name of player" => {player's data}

def players_data_hash
  new_hash = {}
  game_hash.each do |team, hash|
    i = 0
    while i < hash[:players].length do
      player_key = hash[:players][i][:player_name]
      new_hash[player_key] = hash[:players][i]
      i+= 1
    end
  end
  new_hash
  #binding.pry
end
