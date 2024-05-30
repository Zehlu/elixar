ExUnit.start()

defmodule ContagemMaioresQue do

  @spec run(list(integer), integer) :: integer
  def run(nums, n) do
    count_greater(nums, n, 0)
  end

  defp count_greater([], _n, acc), do: acc
  defp count_greater([head | tail], n, acc) do
    new_acc = if head > n, do: acc + 1, else: acc
    count_greater(tail, n, new_acc)
  end

end

defmodule ContagemMaioresQueTest do
  use ExUnit.Case, async: true

  test "conta elementos maiores que N" do
    assert ContagemMaioresQue.run([1, 2, 3, 4, 5], 3) == 2
  end

  test "retorna 0 se nenhum elemento for maior que N" do
    assert ContagemMaioresQue.run([1, 2, 3], 5) == 0
  end
end
