class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end
  
ROCK = "R"
SCISSORS = "S"
PAPER = "P"
WIN = { ROCK => SCISSORS, SCISSORS => PAPER, PAPER => ROCK }
  
def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  
  game[0][1].upcase!
  game[1][1].upcase!
  
  raise NoSuchStrategyError unless check_strategy(game[0][1])
  raise NoSuchStrategyError unless check_strategy(game[1][1])
  
  if game[0][1].eql?(game[1][1])
    return game[0]
  elsif game[0][1].eql?(WIN[game[1][1]])
    return game[1]
  else
    return game[0]
  end
end

def check_strategy(strat)
  match = false
  WIN.each_key{
    |k|
    strat.match(k){ match=true }
  }
  
  return match
end

print rps_game_winner([ ["Jason", PAPER], ["Debbie", SCISSORS] ]), "\n"
print rps_game_winner([ ["Debbie", SCISSORS], ["Maddy", ROCK] ]), "\n"
print rps_game_winner([ ["Maddy", ROCK], ["Jason", PAPER] ]), "\n"
print rps_game_winner([ ["Jason", PAPER], ["Debbie", PAPER] ]), "\n"
#print rps_game_winner([ ["Jason", PAPER], ["Debbie", "X"] ]), "\n"
#print rps_game_winner()
#print rps_game_winner([ ["Jason", PAPER], ["Debbie", SCISSORS], ["Maddy", ROCK] ])
  

def rps_tournament_winner(tourn)
  raise WrongNumberOfPlayersError unless tourn.length == 2
  
  if Array.try_convert(tourn[0][1]) == nil
    return rps_game_winner(tourn)
  else
    bracket0 = rps_tournament_winner(tourn[0])
    bracket1 = rps_tournament_winner(tourn[1])
    return rps_tournament_winner([bracket0, bracket1])
  end
end

print rps_tournament_winner(
[
[
[ ["Armando", "P"], ["Dave", "S"] ],
[ ["Richard", "R"],  ["Michael", "S"] ],
],
[ 
[ ["Allen", "S"], ["Omer", "P"] ],
[ ["David E.", "R"], ["Richard X.", "P"] ]
]
]
), "\n"