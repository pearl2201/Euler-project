defmodule Euler10 do
  defp is_prime(n) when n == 2 do
    true
  end

  defp is_prime(n) when n > 2 do
    Enum.all?(2..(:math.sqrt(n) |> round), fn x -> rem(n, x) != 0 end)
  end

  defp generate_primes() do
    Stream.iterate(2, &(&1 + 1))
    |> Stream.filter(&is_prime(&1))
  end

  def solve do
    generate_primes() |> Stream.take_while(&(&1 < 2_000_000)) |> Enum.sum()
  end
end

Euler10.solve() |> IO.puts()
