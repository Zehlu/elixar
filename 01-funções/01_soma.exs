ExUnit.start()

defmodule Soma do
  
  @spec run(integer, integer) :: integer | :error
  def run(a, b) when is_integer(a) and is_integer(b) do
    if is_nil(a) or is_nil(b) do
      :error
    else
      a + b
    end
  end

  def run(_a, _b), do: :error
end

defmodule SomaTest do
  use ExUnit.Case, async: true

  describe "quando receber 2 números" do
    test "a função deve retornar o resultado da soma desses números" do
      assert Soma.run(1, 2) == 3
      assert Soma.run(3, 2) == 5
    end

    test "a função não deveria aceitar valores nulos" do
      assert :error = Soma.run(nil, 1)
      assert :error = Soma.run(1, nil)
    end

    test "a função não deveria aceitar strings" do
      assert :error = Soma.run("sou uma string", 2)
    end
  end
end
