defmodule FizzBuzz do

  def main(file) do
    
    file
    |> File.read()
    |> get_read_file_return()
    |> String.trim()
    |> split(",")
    |> apply_fizz_buzz()

  end

  def get_read_file_return({:ok, result}) do
    result
  end

  def get_read_file_return({:error, reason}) do
    reason
  end

  def split(string, separator) do
    String.split(string, separator)
  end

  def fizz_buzz(x) do

    cond do
      (div(x, 3) * 3 == x) and (div(x, 5) * 5 != x) -> "Fizz"
      (div(x, 3) * 3 != x) and (div(x, 5) * 5 == x) -> "Buzz"
      (div(x, 3) * 3 == x) and (div(x, 5) * 5 == x) -> "FizzBuzz"
      true -> x
    end

  end

  def apply_fizz_buzz(list) do

    Enum.map(list, &String.to_integer/1)
    |> Enum.map(&fizz_buzz/1)

  end

end
