ExUnit.start()

defmodule ContagemElementos do
  @spec run(list) :: integer
  def run(lista) do
    length(lista)
  end
end

defmodule ContagemElementosTest do
  use ExUnit.Case, async: true

  test "conta os elementos de uma lista vazia" do
    assert ContagemElementos.run([]) == 0
  end

  test "conta os elementos de uma lista com vários itens" do
    assert ContagemElementos.run([1, 2, 3, 4, 5]) == 5
  end
end
