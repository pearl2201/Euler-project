defmodule Euler12 do
  def check_is_valid(n) do
    Enum.filter(1..round(:math.sqrt(n)), fn x -> rem(n, x) == 0 end)
    |> Enum.count()
    |> Kernel.*(2) < 501
  end

  def gen_triangle_numbers() do
    Stream.iterate(2, fn x -> x + 1 end)
    |> Stream.take_while(fn x -> check_is_valid(get_triangle_number_at(x)) end)
  end

  def get_triangle_number_at(n) do
    (n * (n + 1) / 2) |> round
  end

  def solve() do
    (Enum.at(gen_triangle_numbers(), -1) + 1) |> get_triangle_number_at
  end
end

Euler12.solve() |> IO.puts()

# #! /usr/bin/env elixir
# defmodule Problem012 do
#   defp numbers(), do: Stream.unfold(1, fn x -> {x, x + 1} end)

#   defp triangle_number(x), do: 1..x |> Enum.sum()

#   defp factors(n) do
#     1..round(:math.sqrt(n))
#     |> Enum.filter(fn x -> rem(n, x) == 0 end)
#   end

#   defp condition(x) do
#     x
#     |> triangle_number
#     |> factors
#     |> Enum.count()
#     |> Kernel.*(2) < 500
#   end

#   def solve do
#     numbers()
#     |> Stream.take_while(&condition(&1))
#     |> Enum.max()
#     |> Kernel.+(1)
#     |> triangle_number
#   end
# end

# IO.puts(Problem012.solve())
