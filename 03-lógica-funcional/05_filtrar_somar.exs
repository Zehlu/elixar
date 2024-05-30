ExUnit.start()

defmodule FiltrarSomar do

  @spec run(list(integer), integer) :: integer
  def run(nums, n) do
    filtrar_e_somar(nums, n, 0)
  end

  defp filtrar_e_somar([], _n, acc), do: acc

  defp filtrar_e_somar([head | tail], n, acc) when head > n do
    filtrar_e_somar(tail, n, acc + head)
  end

  defp filtrar_e_somar([_head | tail], n, acc) do
    filtrar_e_somar(tail, n, acc)
  end

end

defmodule FiltrarSomarTest do
  use ExUnit.Case, async: true

  test "filtra e soma números maiores que N" do
    assert FiltrarSomar.run([1, 2, 3, 4, 5, 6], 3) == 15
  end

  test "retorna 0 se nenhum número for maior que N" do
    assert FiltrarSomar.run([1, 2, 3], 5) == 0
  end
end
