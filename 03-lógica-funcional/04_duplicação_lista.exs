ExUnit.start()

defmodule DuplicacaoLista do

  @spec run(list(any)) :: list(any)
  def run(lista) do
    duplicar(lista, [])
  end

  defp duplicar([], acc), do: Enum.reverse(acc)

  defp duplicar([head | tail], acc) do
    duplicar(tail, [head, head | acc])
  end

end

defmodule DuplicacaoListaTest do
  use ExUnit.Case, async: true

  test "duplica os elementos de uma lista" do
    assert DuplicacaoLista.run([2, 4, 6]) == [2, 2, 4, 4, 6, 6]
  end

  test "retorna uma lista vazia se a entrada for uma lista vazia" do
    assert DuplicacaoLista.run([]) == []
  end
end
