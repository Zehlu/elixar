ExUnit.start()

defmodule CompreensaoLista do

  @spec run(list(integer)) :: list(integer)
  def run(nums) do
    for num <- nums, is_even(num), do: num * 4
  end

  defp is_even(num), do: rem(num, 2) == 0
end

defmodule CompreensaoListaTest do
  use ExUnit.Case, async: true

  test "filtra e transforma a lista corretamente" do
    assert CompreensaoLista.run([1, 2, 3, 4, 5, 6]) == [8, 16, 24]
  end
end
