defmodule Euler21 do
  def sum_of_proper_divisor(n) do
    below = Enum.filter(2..round(:math.sqrt(n)), fn x -> rem(n, x) == 0 end)
    above = Enum.map(below, &round(n / &1))
    (above ++ below) |> Enum.uniq() |> Enum.sum() |> Kernel.+(1)
  end

  def check(a) do
    b = sum_of_proper_divisor(a)

    if a != b && b < 10000 && a == sum_of_proper_divisor(b) do
      true
    else
      false
    end
  end

  def solve() do
    Enum.filter(2..9999, fn x -> check(x) end) |> Enum.sum()
  end
end

ExUnit.start()

defmodule TestFibb do
  use ExUnit.Case

  test "benchmark" do
    {microsecs, _} = :timer.tc(fn -> Euler21.solve() end)
    # 7118 microsecs
    IO.puts("fib() took #{microsecs} microsecs")
  end
end
