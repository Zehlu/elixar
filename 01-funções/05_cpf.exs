ExUnit.start()

defmodule CPF do
  

end

defmodule CPFTest do
  use ExUnit.Case, async: true

  test "deve retornar true se for um CPF válido" do
    assert CPF.run("529.982.247-25") == true
  end

  test "deve retornar false se os dígitos verificadores nåo forem válidos" do
    refute CPF.run("529.982.247-24")
  end

  test "deve retornar false se os dígitos forem todos iguais" do
    refute CPF.run("111.111.111-11")
  end

  test "deve retornar false se houver caracteres nåo numéricos" do
    refute CPF.run("529a82247-25")
  end

  test "deve retornar false se o CPF tiver o tamanho incorreto" do
    refute CPF.run("529.982.24")
  end
end
