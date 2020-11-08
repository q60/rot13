defmodule Rot13 do
  @spec start(any, any) :: {:ok, pid}
  @spec rotate(any) :: :ok

  def rotate(xs) do
    IO.puts("Encoded string:")
    for x <- xs do
      y = << x :: utf8 >>
        |> String.upcase()
        |> String.to_charlist()
        |> Enum.at(0)
      if 65 <= y and y <= 90 do
        c = <<
              x + (-13 * trunc(abs(y - 77.5)/(y - 77.5))) :: utf8
            >>
        IO.write(c)
      else
        c = << x :: utf8 >>
        IO.write(c)
      end
    end
    IO.write("\n")
  end

  def start(_type, _args) do
    IO.puts("Enter string to encode:")
    IO.read(:stdio, :line)
      |> String.to_charlist()
      |> List.delete_at(-1)
      |> rotate()
    Task.start(fn -> :timer.sleep(1000) end)
  end
end
