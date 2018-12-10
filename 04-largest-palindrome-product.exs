for(
  i <- 999..100,
  j <- 999..100,
  do: {i, j}
)
|> Enum.map(fn {a, b} -> a * b end)
|> Enum.filter(fn x -> Integer.to_string(x) == String.reverse(Integer.to_string(x)) end)
|> Enum.max()
|> Integer.to_string()
|> IO.puts()
