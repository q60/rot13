defmodule Rot13Test do
  use ExUnit.Case
  doctest Rot13

  test "greets the world" do
    assert Rot13.hello() == :world
  end
end
