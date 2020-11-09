defmodule Rot13 do
  @spec start(any, any) :: {:ok, pid}
  @spec rotate(any) :: any

  def rotate(xs) do
    xs
      |> Enum.map(
        fn c ->
          x = << c :: utf8 >>
            |> String.upcase()
            |> String.to_charlist()
            |> Enum.at(0)
          if 65 <= x and x <= 90 do
            c = <<
                  c + (-13 * trunc(abs(x - 77.5)/(x - 77.5))) :: utf8
                >>
            c
          else
            c = << c :: utf8 >>
            c
          end
        end)
  end

  def start(_type, _args) do
    IO.puts("Enter string to encode:")
    IO.puts(
      [
        "Encoded string:\n",
        IO.read(:stdio, :line)
          |> String.to_charlist()
          |> List.delete_at(-1)
          |> rotate()
      ]
    )
    Task.start(fn -> :timer.sleep(1000) end)
  end
end
