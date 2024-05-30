ExUnit.start()

defmodule SomaImpares do

  @spec run(list(integer)) :: integer
  def run(nums) do
    do_run(nums, 0)
  end

  defp do_run([], acc), do: acc
  defp do_run([head | tail], acc) do
    new_acc = if rem(head, 2) != 0, do: acc + head, else: acc
    do_run(tail, new_acc)
  end
end

defmodule SomaImparesTest do
  use ExUnit.Case, async: true

  test "soma números ímpares em uma lista" do
    assert SomaImpares.run([1, 2, 3, 4, 5, 6, 7]) == 16
  end

  test "retorna 0 para uma lista vazia" do
    assert SomaImpares.run([]) == 0
  end
end
