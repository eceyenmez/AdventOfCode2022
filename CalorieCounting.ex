defmodule CalorieCounting do

  def count_calories do

    content = File.stream!("input.txt")
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

end
