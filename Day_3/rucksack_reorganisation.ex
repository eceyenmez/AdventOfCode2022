defmodule RucksackReorganisation do
  @moduledoc false


  def organise_rucksack do

    File.stream!("input.txt")
    |> Enum.reduce(0,fn x, sum ->
      {first, second} = String.split_at(x, (String.length(x)/2) |> Kernel.floor)

      value = MapSet.intersection(Enum.into(String.graphemes(first), MapSet.new), Enum.into(String.graphemes(second), MapSet.new))
      |> MapSet.to_list
      |> List.to_string
      |> :binary.first
      |> get_character_value

      sum + value
    end)

  end

  def organise_rucksack_2 do

      File.stream!("input.txt")
      |> Enum.map(&(String.trim(&1)))
      |> Enum.chunk_every(3)
      |> Enum.reduce(0,fn list, sum ->
        value = get_intersecting_character(list)
        |> MapSet.to_list
        |> List.to_string
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

  defp get_intersecting_character(list) do
    [first,second,third] = Enum.map(list, fn x -> Enum.into(String.graphemes(x), MapSet.new) end)

    first
    |>MapSet.intersection(second)
    |>MapSet.intersection(third)
  end
  
end
