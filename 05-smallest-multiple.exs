defmodule Euler05 do
  def euler05(n) do
    reduce(Enum.reduce(1..n, fn x, acc -> x * acc end), n, n)
  end

  def reduce(acc, 1, n) do
    acc
  end

  def reduce(acc, i, n) do
    IO.puts("#{acc} -- #{i}")

    cond do
      rem(acc, i) != 0 ->
        reduce(acc, i - 1, n)

      Enum.any?(n..2, fn x -> rem(div(acc, i), x) != 0 end) ->
        reduce(acc, i - 1, n)

      true ->
        reduce(div(acc, i), i, n)
    end
  end
end

Euler05.euler05(20) |> IO.puts()
