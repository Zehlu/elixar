ExUnit.start()

defmodule StreamNumerosPares do
  @spec run() :: list(integer)
  def run() do
    Stream.iterate(2, &(&1 + 2))
    |> Enum.take(5)
  end
end

defmodule StreamNumerosParesTest do
  use ExUnit.Case, async: true

  test "retorna os primeiros 5 números pares da sequência" do
    assert StreamNumerosPares.run() == [2, 4, 6, 8, 10]
  end
end
