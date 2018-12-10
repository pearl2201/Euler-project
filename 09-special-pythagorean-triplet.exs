max_a = (1000 / (2 + :math.sqrt(2))) |> :math.floor() |> round
max_b = 500
sum_all = 1000

tuple =
  for(
    a <- 1..max_a,
    b <- (a + 1)..max_b,
    c = 1000 - a - b,
    a * a + b * b == c * c,
    do: a * b * c
  )
  |> List.first()

IO.inspect(tuple, charlists: :as_lists)
