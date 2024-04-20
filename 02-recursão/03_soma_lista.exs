ExUnit.start()

defmodule SomaLista do
  @spec run(list(integer)) :: integer
  def run([]), do: 0
  def run([head | tail]), do: head + run(tail)
end

defmodule SomaListaTest do
  use ExUnit.Case, async: true

  test "deve retornar o somatório de todos os elementos da lista" do
    assert SomaLista.run([1, 2, 3]) == 6
    assert SomaLista.run([3, 2, 1]) == 6
    assert SomaLista.run([0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) == 55
  end
end
