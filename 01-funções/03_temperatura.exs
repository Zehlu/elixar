ExUnit.start()

defmodule Temperatura do

  @spec run(integer, :fahrenheit | :kelvin) :: float | :error

  def run(celsius, :fahrenheit) when is_integer(celsius) do
    (celsius * 9.0 / 5.0) + 32.0
  end

  def run(celsius, :kelvin) when is_integer(celsius) do
    celsius + 273.15
  end

  def run(_, _), do: :error
end

defmodule TemperaturaTest do
  use ExUnit.Case, async: true

  describe "quando recebe um valor de temperatura e uma medida para conversão" do
    test "a função não deve aceitar valores nulos" do
      assert :error = Temperatura.run(nil, :kelvin)
    end

    test "a função deve apenas aceitar valores inteiros" do
      assert :error = Temperatura.run(12.1, :kelvin)
      assert :error = Temperatura.run("string", :fahrenheit)
    end

    test "a função deve retornar o valor em Fahrenheit, respeitando a medida" do
      assert Temperatura.run(37, :fahrenheit) == 98.6
    end

    test "a função deve retornar o valor em Kelvin, respeitando a medida" do
      assert Temperatura.run(25, :kelvin) == 298.15
    end
  end
end
