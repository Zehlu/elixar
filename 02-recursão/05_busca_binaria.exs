ExUnit.start()

defmodule BuscaBinaria do
  @spec run(list(integer), integer) :: boolean
  def run([], _), do: false

  def run(xs, x) do
    middle_index = div(length(xs), 2)
    middle_element = Enum.at(xs, middle_index)

    cond do
      middle_element == x -> true
      length(xs) == 1 -> false
      x < middle_element -> run(Enum.slice(xs, 0, middle_index), x)
      true -> run(Enum.slice(xs, middle_index + 1, length(xs)), x)
    end
  end
end

defmodule BuscaBinariaTest do
  use ExUnit.Case, async: true

  test "deve encontrar um elemento existente na lista" do
    assert BuscaBinaria.run([1, 2, 3], 3) == true
    assert BuscaBinaria.run([2, 4, 6, 8, 10], 6) == true
  end

  test "deve retornar false se o elemento não existe na lista" do
    refute BuscaBinaria.run([1, 2, 3], 0)
    refute BuscaBinaria.run([2, 4, 6, 8, 10], 1)
  end
end
