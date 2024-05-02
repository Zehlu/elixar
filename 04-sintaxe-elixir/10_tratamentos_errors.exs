ExUnit.start()

defmodule TratamentoErros do

  @spec run(map, atom) :: String.t()
  def run(mapa, chave) do
    try do
      Map.fetch!(mapa, chave)
    rescue
      KeyError ->
        "Chave não encontrada"
    end
  end
end

defmodule TratamentoErrosTest do
  use ExUnit.Case, async: true

  test "retorna mensagem de erro quando a chave não existe" do
    assert TratamentoErros.run(%{a: 1}, :b) == "Chave não encontrada"
  end
end
