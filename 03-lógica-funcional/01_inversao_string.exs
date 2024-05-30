ExUnit.start()

defmodule InversaoString do

  @spec run(String.t()) :: String.t()
  def run(s) do
    do_run(String.graphemes(s))
  end

  defp do_run([]), do: ""
  defp do_run([head | tail]), do: do_run(tail) <> head
end

defmodule InversaoStringTest do
  use ExUnit.Case, async: true

  test "inverte uma string não vazia" do
    assert InversaoString.run("botafogo") == "ogofatob"
  end

  test "retorna uma string vazia quando a entrada também for uma string vazia" do
    assert InversaoString.run("") == ""
  end
end
