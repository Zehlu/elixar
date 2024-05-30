ExUnit.start()

defmodule ConcatenacaoExclusiva do

  @spec run(list(any), list(any)) :: list(any)
  def run(lista1, lista2) do
    exclusivos1 = lista1 |> Enum.filter(&(&1 not in lista2))
    exclusivos2 = lista2 |> Enum.filter(&(&1 not in lista1))
    exclusivos1 ++ exclusivos2
  end

end

defmodule ConcatenacaoExclusivaTest do
  use ExUnit.Case, async: true

  test "concatena listas excluindo elementos repetidos" do
    assert ConcatenacaoExclusiva.run([1, 2, 3], [3, 4, 5]) == [1, 2, 4, 5]
  end

  test "concatena uma lista vazia com uma lista não vazia" do
    assert ConcatenacaoExclusiva.run([], [1, 2, 3]) == [1, 2, 3]
  end
end
