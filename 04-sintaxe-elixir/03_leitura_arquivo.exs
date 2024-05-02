ExUnit.start()

defmodule LeituraArquivoMaiusculas do
  @spec run(String.t()) :: String.t() | :error
  def run(path) do
    case File.read(path) do
      {:ok, content} -> String.upcase(content)
      {:error, _reason} -> :error
    end
  end
end

defmodule LeituraArquivoMaiusculasTest do
  use ExUnit.Case, async: true

  test "retorna o conteúdo do arquivo em maiúsculas" do
    assert LeituraArquivoMaiusculas.run("conteudo.txt") == "CONTEÚDO DE TESTE"
  end
end
