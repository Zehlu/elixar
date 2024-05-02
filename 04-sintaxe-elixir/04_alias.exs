ExUnit.start()

defmodule ModuloLongoComFuncao do
  def funcao_longa() do
    :ok
  end
end

defmodule UsoAlias do

  @spec run() :: atom
  def run() do
    alias ModuloLongoComFuncao, as: ML
    ML.funcao_longa()
  end
end

defmodule UsoAliasTest do
  use ExUnit.Case, async: true

  test "demonstra o uso de alias" do
    assert UsoAlias.run() == :ok
  end
end
