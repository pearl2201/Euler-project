defmodule Nprimes do
  def get_largest_prime_factor(n) do
    reduce(n, 2)
  end

  def reduce(n, i) do
    if i >= n do
      n
    else
      if rem(n, i) == 0 do
        reduce(div(n, i), i)
      else
        reduce(n, i + 1)
      end
    end
  end
end

IO.inspect(Nprimes.get_largest_prime_factor(600_851_475_143))
