ExUnit.start()

defmodule Idade do

  @spec run(integer) :: :infantil | :adolescente | :adulto | :idoso | :error
  def run(idade) when is_integer(idade) do
    if idade < 0 do
      :error
    else
      cond do
        idade <= 12 -> :infantil
        idade <= 24 -> :adolescente
        idade <= 59 -> :adulto
        true -> :idoso
      end
    end
  end
  def run(_), do: :error
end

defmodule IdadeTest do
  use ExUnit.Case, async: true

  describe "quando recebe uma quantodade de anos" do
    test "a função não deve aceitar valores nulos" do
      assert :error = Idade.run(nil)
    end

    test "a função deve aceitar apenas inteiros" do
      assert :error = Idade.run("string")
      assert :error = Idade.run(1.2)
    end

    test "a função deve retornar :infantil se o valor for até 12 anos" do
      for idade <- 0..12 do
        assert :infantil = Idade.run(idade)
      end
    end

    test "a função deve retornar :adolescente se o valor for entre 13 e 24 anos" do
      for idade <- 13..24 do
        assert :adolescente = Idade.run(idade)
      end
    end

    test "a função deve retornar :adolescente se o valor for entre 25 e 59 anos" do
      for idade <- 25..59 do
        assert :adulto = Idade.run(idade)
      end
    end

    test "a função deve retornar :adolescente se o valor for 60 ou mais anos" do
      for idade <- 60..100 do
        assert :idoso = Idade.run(idade)
      end
    end
  end
end
