ExUnit.start()

defmodule FiltragemLista do
  @spec run(list, (any -> boolean)) :: list
  def run(lista, filtro) do
    Enum.filter(lista, filtro)
  end
end

defmodule FiltragemListaTest do
  use ExUnit.Case, async: true

  test "filtra elementos pares de uma lista" do
    assert FiltragemLista.run([1, 2, 3, 4, 5], fn x -> rem(x, 2) == 0 end) == [2, 4]
  end

  test "filtra elementos maiores que 3" do
    assert FiltragemLista.run([1, 2, 3, 4, 5], fn x -> x > 3 end) == [4, 5]
  end
end
