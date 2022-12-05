defmodule CalorieCounting do

  def count_calories do

    File.stream!("input.txt")
    |> Enum.map(fn x ->
      case x do
        "\n" -> "-"
        _ -> x |> String.trim |> String.to_integer
      end
    end)
    |> Enum.chunk_by(&(&1 == "-"))
    |> Enum.filter(fn x -> x != ["-"] end)
    |> Enum.reduce(0, fn x, acc -> if (sum = Enum.sum(x)) > acc, do: sum, else: acc end)

  end

  def count_calories_2 do

    File.stream!("input.txt")
    |> Enum.map(fn x ->
      case x do
        "\n" -> "-"
        _ -> x |> String.trim |> String.to_integer
        end
      end)
    |> Enum.chunk_by(&(&1 == "-"))
    |> Enum.filter(fn x -> x != ["-"] end)
    |> Enum.map(fn x -> Enum.sum(x) end)
    |> Enum.sort(&(&1 >= &2))
    |> Enum.take(3)
    |> Enum.sum

  end

end
