ExUnit.start()

defmodule Subconjuntos do
  @spec run(list(any)) :: list(list(any))
  def run(lista), do: subconjuntos(lista)

  defp subconjuntos([]), do: [[]]
  defp subconjuntos([h | t]) do
    subconjuntos(t) ++ Enum.map(subconjuntos(t), &([h | &1]))
  end
end

defmodule SubconjuntosTest do
  use ExUnit.Case, async: true

  test "retorna todos os subconjuntos de uma lista" do
    assert Enum.sort(Subconjuntos.run([1, 2])) == Enum.sort([[], [1], [2], [1, 2]])
  end

  test "inclui o conjunto vazio como subconjunto" do
    assert Subconjuntos.run([]) == [[]]
  end
end
