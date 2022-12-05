defmodule RockPaperScissors do

  #lazy solution since there are only 9 possible hands I computed a lookup table for performance
  @game_moves %{"A X": 4, "B X": 1, "C X": 7, "A Y": 8, "B Y": 5, "C Y": 2, "A Z": 3, "B Z": 9, "C Z": 6}

  def play do

    File.stream!("input.txt")
    |> Enum.reduce(0,fn x, sum ->
      hand = x |> String.trim |> String.to_atom
      score = @game_moves[hand]
      sum + score
    end)

  end

  @winning_value %{"A" => 2, "B" => 3, "C" => 1}
  @draw_value %{"A" => 1, "B" => 2, "C" => 3}
  @loose_value %{"A" => 3, "B" => 1, "C" => 2}

  def play_2 do

    File.stream!("input.txt")
    |> Enum.reduce(0,fn x, sum ->
      line = x |> String.split
      [opponent_move , strategy] = line
      case strategy do
        "X" -> sum + @loose_value[opponent_move]
        "Y" -> sum + @draw_value[opponent_move] + 3
        "Z" -> sum + @winning_value[opponent_move] + 6
      end
    end)

  end


end
