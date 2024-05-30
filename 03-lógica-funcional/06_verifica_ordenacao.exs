ExUnit.start()

defmodule ListaOrdenada do

  @spec run(list(integer)) :: boolean
  def run([]), do: true
  def run([_]), do: true
  def run([a, b | rest]) when a <= b do
    run([b | rest])
  end
  def run(_), do: false

end

defmodule ListaOrdenadaTest do
  use ExUnit.Case, async: true

  test "verifica lista ordenada corretamente" do
    assert ListaOrdenada.run([1, 2, 3, 4, 5]) == true
  end

  test "retorna false para lista não ordenada" do
    assert ListaOrdenada.run([1, 3, 2]) == false
  end
end
