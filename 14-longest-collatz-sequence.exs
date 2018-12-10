defmodule Euler14 do
  def collatz_sequence(n, l) when n == 1 do
    l
  end

  def collatz_sequence(n, l) when n > 1 do
    if rem(n, 2) == 0 do
      collatz_sequence(round(n / 2), l + 1)
    else
      collatz_sequence(round(3 * n + 1), l + 1)
    end
  end

  def solve() do
    Enum.max_by(2..1_000_000, fn x -> collatz_sequence(x, 0) end)
  end
end

Euler14.solve() |> IO.puts()
