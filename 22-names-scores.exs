defmodule Euler22 do
  defp get_name_value({word, index_word}) do
    Enum.reduce(String.to_charlist(word), 0, fn x, acc -> x - 64 + acc end) * (index_word + 1)
  end

  def solve() do
    File.read!("p022_names.txt")
    |> String.split(",", trim: true)
    |> Enum.map(fn word -> String.replace(word, "\"", "", []) end)
    |> Enum.sort()
    |> Enum.with_index()
    |> Enum.map(&get_name_value(&1))
    |> Enum.sum()
  end
end

Euler22.solve() |> IO.puts()
