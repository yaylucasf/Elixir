defmodule FizzBuzz do

  def main(file) do

    file |> File.read() |> get_file_read_result() |> format()
    |> Enum.map(&String.to_integer/1) |> Enum.map(&fizz_buzz/1)

  end

  def get_file_read_result({:ok, result}), do: result
  def get_file_read_result({:error, reason}), do: reason

  def format(:enoent), do: exit("This file doesn't exist!")

  def format(string) do

    string |> String.trim() |> String.split(",")

  end

  def fizz_buzz(x) do

    cond do

      (div(x, 3) * 3 == x) && (div(x, 5) * 5 != x) -> "Fizz"
      (div(x, 3) * 3 != x) && (div(x, 5) * 5 == x) -> "Buzz"
      (div(x, 3) * 3 == x) && (div(x, 5) * 5 == x) -> "FizzBuzz"
      true -> x

    end

  end

end
