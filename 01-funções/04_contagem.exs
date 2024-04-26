ExUnit.start()

defmodule Contagem do

  @spec run(String.t(), String.t()) :: integer
  def run(frase, palavra) do
    frase
    |> String.split(" ", trim: true)
    |> Enum.count(&(&1 == palavra))
  end
end

defmodule ContagemTest do
  use ExUnit.Case, async: true

  describe "quando recebe uma frase e uma palavra a função deve retornar o número de ocorrências de uma dada palavra" do
    test "quando for uma string vazia" do
      assert Contagem.run("", "teste") == 0
    end

    test "quando for apenas uma única ocorrência" do
      assert Contagem.run("O gato e o rato", "gato") == 1
      assert Contagem.run("O gato e o rato", "rato") == 1
    end

    test "quando for múltiplas ocorrências" do
      assert Contagem.run("sol sol sol lua lua estrela", "sol") == 3
      assert Contagem.run("sol sol sol lua lua estrela", "lua") == 2
      assert Contagem.run("sol sol sol lua lua estrela", "estrela") == 1
    end
  end
end
