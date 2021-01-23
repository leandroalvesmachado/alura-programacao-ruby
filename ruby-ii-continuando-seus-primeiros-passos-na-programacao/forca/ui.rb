# isso -> def avisa_chute_efetuado(chute)
# equivalente 
def avisa_chute_efetuado chute 
    puts "Você já chutou #{chute}"
end


def avisa_letra_nao_encontrada
    puts "Letra não encontrada."
end


def avisa_letra_encontrada(total_encontrado)
    puts "Letra encontrada #{total_encontrado} vezes."
end


def avisa_acertou_palavra
    puts "Parabéns! Acertou!"
end


def avisa_errou_palavra
    puts "Que pena... errou"
end


def avisa_pontos(pontos_ate_agora)
    puts "Você ganhou #{pontos_ate_agora} pontos."
end


def da_boas_vindas
    puts "Bem vindo ao jogo da forca"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}."
end


def avisa_escolhendo_palavra
    puts "Escolhendo uma palavra secreta..."
end


def avisa_palavra_escolhida(palavra_secreta)
    puts "Palavra secreta com #{palavra_secreta.size} letras... boa sorte!"

    palavra_secreta
end


def nao_quer_jogar?
    puts "Deseja jogar novamente? (S/N)"
    # gets captura texto digitado pelo usuario
    # strip remove os caracteres em branco
    quer_jogar = gets.strip

    # upcase (transforma em maiusculo)
    # return true ou false essa var nao_quero_jogar
    nao_quero_jogar = quer_jogar.upcase == "N"
end


def cabecalho_de_tentativa(chutes, erros, mascara)
    puts "\n\n\n\n"
    puts "Palavra secreta: #{mascara}"
    puts "Erros até agora: #{erros}"
    puts "Chutes até agora: #{chutes}"
end


def pede_um_chute
    puts "Entre com uma letra ou uma palavra"
    chute = gets.strip
    puts "Será que acertou? Você chutou #{chute}"

    chute
end


# def conta(texto, letra)
#     total_encontrado = 0
#     # transforma string em um array. Ex: string igual a nome, array ['n', 'o', 'm', 'e']
#     texto.chars
            
#     for caractere in texto.chars
#         if caractere == letra
#             total_encontrado += 1
#         end
#     end

#     # equivalente a return total_encontrado
#     total_encontrado
# end

