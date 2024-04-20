ExUnit.start()

defmodule OrdenacaoLista do
  @spec run(list(integer)) :: list(integer)
  def run([]), do: []
  def run([pivot | rest]) do
    smaller = for x <- rest, x <= pivot, do: x
    greater = for x <- rest, x > pivot, do: x
    run(smaller) ++ [pivot] ++ run(greater)
  end
end

defmodule OrdenacaoListaTest do
  use ExUnit.Case, async: true

  test "ordena uma lista de inteiros" do
    assert OrdenacaoLista.run([5, 3, 4, 1, 2]) == [1, 2, 3, 4, 5]
    assert OrdenacaoLista.run([3, 5, 1, 4, 2]) == [1, 2, 3, 4, 5]
  end

  test "ordena uma lista já ordenada" do
    assert OrdenacaoLista.run([1, 2, 3, 4, 5]) == [1, 2, 3, 4, 5]
  end
end
