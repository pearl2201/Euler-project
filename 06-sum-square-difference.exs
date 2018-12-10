sum_of_the_square = fn x -> 1..x |> Enum.reduce(fn x, acc -> acc + :math.pow(2) end) end
square_of_the_sum = fn x -> 1..x |> Enum.sum() |> :math.pow(2) end

(square_of_the_sum.(100) - sum_of_the_square.(100)) |> IO.puts()
