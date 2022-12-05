defmodule RockPaperScissors do

  @game_moves %{"A X": 4, "B X": 1, "C X": 7, "A Y": 8, "B Y": 5, "C Y": 2, "A Z": 3, "B Z": 9, "C Z": 6}

  def play do

    File.stream!("input.txt")
    |> Enum.reduce(0,fn x, sum ->
      hand = x |> String.trim |> String.to_atom
      score = @game_moves[hand]
      sum = sum + score
    end)

  end


end
