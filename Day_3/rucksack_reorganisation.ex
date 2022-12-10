defmodule RucksackReorganisation do
  @moduledoc false


  def organise_rucksack do

    File.stream!("input.txt")
    |> Enum.reduce(0,fn x, sum ->
      {first, second} = String.split_at(x, (String.length(x)/2) |> Kernel.floor)

      value = MapSet.intersection(Enum.into(String.graphemes(first), MapSet.new), Enum.into(String.graphemes(second), MapSet.new))
      |> MapSet.to_list
      |> List.to_string |> IO.inspect
      |> :binary.first
      |> get_character_value

      sum + value
    end)

  end

  defp get_character_value(char) when char <= 90 do
    char - 38
  end

  defp get_character_value(char) do
    char - 96
  end
  
end
