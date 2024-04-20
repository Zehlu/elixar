ExUnit.start()

defmodule Fibonnacci do

  @spec run(integer) :: list(integer)
  def run(n) when n >= 0 do
    run(n, [])
  end

  defp run(0, acc), do: Enum.reverse(acc)
  defp run(n, []) when n > 0, do: run(n - 1, [1])
  defp run(n, [x | _] = acc) when n > 0 do
    run(n - 1, [fibonacci_term(acc) | acc])
  end

  defp fibonacci_term([x]), do: x
  defp fibonacci_term([x, y | _]), do: x + y
  
end

defmodule FibonnacciTest do
  use ExUnit.Case, async: true

  test "deve retornar a sequência de fibonnacci com seus valores corretos" do
    assert Fibonnacci.run(2) == [1, 1]
    assert Fibonnacci.run(5) == [1, 1, 2, 3, 5]
    assert Fibonnacci.run(8) == [1, 1, 2, 3, 5, 8, 13, 21]
  end
end
