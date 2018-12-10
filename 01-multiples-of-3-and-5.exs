1..999 
	|> Enum.filter(fn(n) -> rem(n,3) ==0 or rem(n,5) == 0) end) 
	|> Enum.reduce(&+/2) 
	|> IO.puts
