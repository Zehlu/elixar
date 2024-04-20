defmodule JogoPedraPapelTesoura do

  def jogo do

    opcoes = ["pedra", "papel", "tesoura"]
    escolha_computador = Enum.random(opcoes)

    IO.puts("Escolha: pedra, papel ou tesoura")
        
    escolha_jogador = "pedra"
    

    case {escolha_jogador, escolha_computador} do
      {j, c} when j == c ->
        IO.puts("Empate!")
      {j, "pedra"} when j == "papel" ->
        IO.puts("Você ganhou! Papel cobre pedra.")
      {j, "papel"} when j == "tesoura" ->
        IO.puts("Você ganhou! Tesoura corta papel.")
      {j, "tesoura"} when j == "pedra" ->
        IO.puts("Você ganhou! Pedra quebra tesoura.")
      _ ->
        IO.puts("Você perdeu! #{escolha_computador} vence #{escolha_jogador}.")
    end
  end
  
  
end

JogoPedraPapelTesoura.jogo()
