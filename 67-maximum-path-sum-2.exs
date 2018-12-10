# Elixir i s too hard :((
defmodule Euler67 do
  def estimate_row(m, j, n, v) when j > n do
    m |> Enum.max()
  end

  def estimate_row(m, 1, n, v) do
    estimate_row(m ++ [Enum.at(v, 0)], 2, n, v)
  end

  def estimate_row(m, j, n, v) when j > 1 and j <= n do
    start_row = round(j * (j - 1) / 2)
    start_prev_row = round((j - 1) * (j - 2) / 2)

    tuple =
      Enum.map(0..(j - 1), fn i ->
        mij = Enum.at(v, start_row + i)

        cond do
          i == 0 ->
            mij + Enum.at(m, start_prev_row + i)

          i > 0 and i < j - 1 ->
            if Enum.at(m, start_prev_row + i) > Enum.at(m, start_prev_row + i - 1) do
              mij + Enum.at(m, start_prev_row + i)
            else
              mij + Enum.at(m, start_prev_row + i - 1)
            end

          i == j - 1 ->
            mij + Enum.at(m, start_prev_row + i - 1)
        end
      end)

    estimate_row(m ++ tuple, j + 1, n, v)
  end

  def solve() do
    body = File.read!("p067_triangle.txt")
    rows = String.split(body, "\n", trim: true)
    n = length(rows)

    v =
      Enum.map(rows, fn x -> String.split(x, " ", trim: true) end)
      |> List.flatten()
      |> Enum.map(fn x ->
        {y, _} = Integer.parse(x)
        y
      end)

    estimate_row([], 1, n, v)
  end
end

Euler67.solve() |> IO.puts()
