defmodule Euler18 do
  @v [
    75,
    95,
    64,
    17,
    47,
    82,
    18,
    35,
    87,
    10,
    20,
    04,
    82,
    47,
    65,
    19,
    01,
    23,
    75,
    03,
    34,
    88,
    02,
    77,
    73,
    07,
    63,
    67,
    99,
    65,
    04,
    28,
    06,
    16,
    70,
    92,
    41,
    41,
    26,
    56,
    83,
    40,
    80,
    70,
    33,
    41,
    48,
    72,
    33,
    47,
    32,
    37,
    16,
    94,
    29,
    53,
    71,
    44,
    65,
    25,
    43,
    91,
    52,
    97,
    51,
    14,
    70,
    11,
    33,
    28,
    77,
    73,
    17,
    78,
    39,
    68,
    17,
    57,
    91,
    71,
    52,
    38,
    17,
    14,
    91,
    43,
    58,
    50,
    27,
    29,
    48,
    63,
    66,
    04,
    68,
    89,
    53,
    67,
    30,
    73,
    16,
    69,
    87,
    40,
    31,
    04,
    62,
    98,
    27,
    23,
    09,
    70,
    98,
    73,
    93,
    38,
    53,
    60,
    04,
    23
  ]

  def estimate_row(m, j, n) when j > n do
    m |> Enum.max()
  end

  def estimate_row(m, 1, n) do
    estimate_row(m ++ [Enum.at(@v, 0)], 2, n)
  end

  def estimate_row(m, j, n) when j > 1 and j <= n do
    start_row = round(j * (j - 1) / 2)
    start_prev_row = round((j - 1) * (j - 2) / 2)

    tuple =
      Enum.map(0..(j - 1), fn i ->
        mij = Enum.at(@v, start_row + i)

        cond do
          i == 0 ->
            mij + Enum.at(m, start_prev_row + i)

          i > 0 and i < j - 1 ->
            mij +
              max(
                Enum.at(m, start_prev_row + i),
                Enum.at(m, start_prev_row + i - 1)
              )

          i == j - 1 ->
            mij + Enum.at(m, start_prev_row + i - 1)
        end
      end)

    estimate_row(m ++ tuple, j + 1, n)
  end

  def solve() do
    estimate_row([], 1, 15)
  end
end

Euler18.solve() |> IO.puts()
