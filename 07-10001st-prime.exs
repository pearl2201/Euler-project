defmodule Primes do
  @seed [2, 3]

  def get_primes(n) when n <= 2 do
    Enum.take(@seed, n)
  end

  def get_primes(n) when n > 2 do
    get_primes(@seed, Enum.at(@seed, -1) + 1, n)
  end

  def get_primes(acc, i, n) do
    if length(acc) == n do
      Enum.at(acc, -1)
    else
      if Enum.any?(acc, fn x -> rem(i, x) == 0 end) do
        get_primes(acc, i + 1, n)
      else
        acc |> IO.inspect(charlists: :as_lists)
        get_primes(acc ++ [i], i + 1, n)
      end
    end
  end
end

Primes.get_primes(10001) |> IO.puts()
