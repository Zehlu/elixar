ExUnit.start()

defmodule Fatorial do
  @spec run(integer) :: integer
  def run(0), do: 1
  def run(n) when n > 0, do: n * run(n - 1)
end

defmodule FatorialTest do
  use ExUnit.Case, async: true

  test "deve calcular o fatorial de um número inteiro corretamente" do
    assert Fatorial.run(1) == 1
    assert Fatorial.run(2) == 2
    assert Fatorial.run(3) == 6
    assert Fatorial.run(4) == 24
    assert Fatorial.run(5) == 120
    assert Fatorial.run(20) == 2_432_902_008_176_640_000
  end
end
