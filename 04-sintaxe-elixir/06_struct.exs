ExUnit.start()

defmodule CriacaoStruct do

  defstruct x: 0, y: 0

  @spec criar(integer, integer) :: map
  @spec mover(map, integer, integer) :: map

  def criar(x, y), do: %__MODULE__{x: x, y: y}

  def mover(ponto, dx, dy) do
    %{ x: ponto.x + dx, y: ponto.y + dy }
  end
end

defmodule CriacaoStructTest do
  use ExUnit.Case, async: true

  test "move o ponto corretamente" do
    ponto = CriacaoStruct.criar(2, 3)
    assert CriacaoStruct.mover(ponto, 5, 7) == %{x: 7, y: 10}
  end
end
