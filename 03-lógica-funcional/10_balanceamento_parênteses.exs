ExUnit.start()

defmodule VerificacaoParenteses do
  @spec run(String.t()) :: boolean
  def run(s) do
    check_balance(s, 0)
  end

  defp check_balance("", 0), do: true
  defp check_balance("", _), do: false
  defp check_balance(<<char, rest::binary>>, count) do
    cond do
      char == ?( -> check_balance(rest, count + 1)
      char == ?) && count > 0 -> check_balance(rest, count - 1)
      char == ?) && count == 0 -> false
      true -> check_balance(rest, count)
    end
  end
end

defmodule VerificacaoParentesesTest do
  use ExUnit.Case, async: true

  test "deve retornar true para uma string vazia" do
    assert VerificacaoParenteses.run("") == true
  end

  test "deve retornar true para strings com parênteses corretamente balanceados" do
    assert VerificacaoParenteses.run("()") == true
    assert VerificacaoParenteses.run("((()))") == true
  end

  test "deve retornar false para strings com parênteses não balanceados" do
    assert VerificacaoParenteses.run(")(") == false
    assert VerificacaoParenteses.run("((())") == false
  end
end
