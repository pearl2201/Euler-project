defmodule Euler20 do
  def solve(n) do
    Enum.reduce(1..n, fn x, acc -> x * acc end) |> Integer.digits() |> Enum.sum()
  end
end

Euler20.solve(100) |> IO.puts()
