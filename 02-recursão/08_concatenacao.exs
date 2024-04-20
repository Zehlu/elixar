ExUnit.start()

defmodule ConcatenacaoListas do
  @spec run(list, list) :: list
  def run(lista1, lista2) do
    lista1 ++ lista2
  end
end

defmodule ConcatenacaoListasTest do
  use ExUnit.Case, async: true

  test "concatena duas listas não vazias" do
    assert ConcatenacaoListas.run([1, 2, 3], [4, 5]) == [1, 2, 3, 4, 5]
  end

  test "concatena uma lista vazia com uma lista não vazia" do
    assert ConcatenacaoListas.run([], [1, 2, 3]) == [1, 2, 3]
  end
end
