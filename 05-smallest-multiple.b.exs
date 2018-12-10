defmodule Euler05b do
  def get_primes(n) do
    Enum.filter(2..n, fn x -> is_primes(x) end)
  end

  def is_primes(n) when n in [2, 3] do
    true
  end

  def is_primes(n) do
    sqrt_n = n |> :math.sqrt() |> :math.floor() |> round
    !Enum.any?(2..sqrt_n, fn i -> rem(n, i) == 0 end)
  end

  def get_max_factor(i, n) do
  end
end

Euler05b.get_primes(20) |> IO.inspect(charlists: :as_lists)
