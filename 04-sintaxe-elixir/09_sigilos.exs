ExUnit.start()

defmodule UsoSigilos do

  @spec run(String.t()) :: list(String.t())
  def run(texto) do
    Regex.scan(~r/\d+/, texto) |> Enum.map(& hd(&1))
  end
end

defmodule UsoSigilosTest do
  use ExUnit.Case, async: true

  test "extrai números da string corretamente" do
    assert UsoSigilos.run("Os números são 123 e 456") == ["123", "456"]
  end
end
