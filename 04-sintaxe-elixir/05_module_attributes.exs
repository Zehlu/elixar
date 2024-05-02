ExUnit.start()

defmodule UsoModuleAttributes do
  @valor_constante 42

  @spec run() :: String.t()
  def run() do
    "O valor da constante é: #{@valor_constante}"
  end
end

defmodule UsoModuleAttributesTest do
  use ExUnit.Case, async: true

  test "retorna a string com o valor da constante" do
    assert UsoModuleAttributes.run() == "O valor da constante é: 42"
  end
end
