ExUnit.start()

defmodule InversaoLista do
  @spec run(list(integer)) :: list(integer)
  def run([]), do: []
  def run([head | tail]), do: run(tail) ++ [head]
end

defmodule InversaoListaTest do
  use ExUnit.Case, async: true

  test "deve inverter a ordem dos elementos de uma lista" do
    assert InversaoLista.run([]) == []
    assert InversaoLista.run([1]) == [1]
    assert InversaoLista.run([1, 2, 3]) == [3, 2, 1]
  end
end
