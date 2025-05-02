defmodule Rot13 do
  def rotate({k, v}) do
    cond do
      v in ?A..?M ->
        k + 13

      v in ?N..?Z ->
        k - 13

      true ->
        k
    end
  end

  def main(_) do
    encoded =
      IO.gets("Enter string to encode:\n")
      |> String.trim()
      |> then(fn xs ->
        List.zip([
          xs
          |> String.to_charlist(),
          xs
          |> String.upcase()
          |> String.to_charlist()
        ])
      end)
      |> Enum.map(&rotate/1)

    IO.puts("Encoded string:\n#{encoded}")
  end
end
