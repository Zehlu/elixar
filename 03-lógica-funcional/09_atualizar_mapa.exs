ExUnit.start()

defmodule AtualizarMapaAninhado do
  @spec run(map(), list(atom()), any()) :: map()
  def run(mapa, [chave | []], valor) do
    Map.put(mapa, chave, valor)
  end

  def run(mapa, [chave | resto], valor) do
    submapa = Map.get(mapa, chave, %{})
    novo_submapa = run(submapa, resto, valor)
    Map.put(mapa, chave, novo_submapa)
  end
end

defmodule AtualizarMapaAninhadoTest do
  use ExUnit.Case, async: true

  test "atualiza corretamente um valor em um mapa aninhado" do
    mapa = %{a: %{b: %{c: 1}}}
    assert AtualizarMapaAninhado.run(mapa, [:a, :b, :c], 2) == %{a: %{b: %{c: 2}}}
  end

  test "cria uma estrutura de mapa aninhada se ela não existir" do
    assert AtualizarMapaAninhado.run(%{}, [:x, :y], 10) == %{x: %{y: 10}}
  end
end
