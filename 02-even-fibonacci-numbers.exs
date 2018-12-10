defmodule Euler02 do
  def fibo_stream do
    Stream.unfold({0, 1}, fn {a, b} -> {a, {b, a + b}} end)
  end
end

Euler02.fibo_stream()
|> Stream.filter(fn n -> rem(n, 2) == 0 end)
|> Stream.take_while(fn n -> n < 4_000_000 end)
|> Enum.reduce(fn x, acc -> x + acc end)
|> IO.puts()
