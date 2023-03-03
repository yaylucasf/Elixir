defmodule FizzBuzz do

    def main(file) do
    
        file
        |> File.read()
        |> get_result()
        |> String.trim()
        |> String.split(",")
        |> Enum.map(&String.to_integer/1)
        |> Enum.map(&fizz_buzz/1)
        
    end

	  def get_result({:ok, result}), do: result
	  def get_result({:error, reason}), do: reason

    def fizz_buzz(x) do
    
		cond do
    
		    div(x, 3) * 3 == x and div(x, 5) * 5 != x -> "Fizz"
		    div(x, 3) * 3 != x and div(x, 5) * 5 == x -> "Buzz"
		    div(x, 3) * 3 == x and div(x, 5) * 5 == x -> "FizzBuzz"
			true -> x
      
    end
    
    end    
    
end
