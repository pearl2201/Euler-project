defmodule Euler23 do
  def is_abundant?(n) when n < 12 do
    false
  end

  def is_abundant?(n) when n >= 12 do
    below = Enum.filter(2..round(:math.sqrt(n)), fn x -> rem(n, x) == 0 end)
    above = Enum.map(below, &round(n / &1))
    sum_divisor = (below ++ above) |> Enum.uniq() |> Enum.sum() |> Kernel.+(1)

    if sum_divisor > n do
      true
    else
      false
    end
  end

  def get_abundants() do
    Enum.filter(1..28123, fn x -> is_abundant?(x) end)
  end

  def solve() do
    abundants = get_abundants()
    abundants |> IO.inspect()

    all_sum_two_abundant_number =
      for(i <- abundants, j <- abundants, do: {i, j})
      |> Enum.map(fn {x, y} -> x + y end)
      |> Enum.uniq()

    Enum.filter(1..28123, fn x -> !(x in all_sum_two_abundant_number) end) |> Enum.sum()
  end
end

Euler23.solve() |> IO.puts()
