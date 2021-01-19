def da_boas_vindas
    puts "Bem vindo ao jogo da forca"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}."
end


def escolhe_palavra_secreta
    puts "Escolhendo uma palavra secreta..."
    palavra_secreta = "programador"
    puts "Palavra secreta com #{palavra_secreta.size} letras... boa sorte!"
    
    # equivalente a return palavra_secreta
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


def pede_um_chute(chutes, erros)
    puts "\n\n\n\n"
    puts "Erros até agora: #{erros}"
    puts "Chutes até agora: #{chutes}"
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


def joga(nome)
    palavra_secreta = escolhe_palavra_secreta

    erros = 0
    chutes = []
    pontos_ate_agora = 0

    while erros < 5
        # equivalente a chute = pede_um_chute(chutes, erros)
        chute = pede_um_chute chutes, erros

        # verificando se o chute ja existe no array chutes
        if chutes.include? chute
            puts "Voê já chutou  #{chute}"
            # volta para a iteração anterior, no caso o while
            # proxima iteração, não segue o código para baixo
            next
        end

        chutes << chute

        chutou_uma_letra = chute.size == 1
        if chutou_uma_letra
            letra_procurada = chute[0]
            
            # usando o função conta
            # total_encontrado = conta palavra_secreta, letra_procurada
            # ruby ja possui uma função que conta as repetições de uma letra na string
            total_encontrado = palavra_secreta.count letra_procurada

            if total_encontrado == 0
                puts "Letra não encontrada."
                erros += 1
            else
                puts "Letra encontrada #{total_encontrado} vezes."
            end
        else
            acertou = chute == palavra_secreta
            if acertou
                puts "Parabéns! Acertou!"
                pontos_ate_agora += 100
                break
            else
                puts "Que pena... errou"
                pontos_ate_agora -= 30
                erros += 1
            end
        end
    end

    puts "Você ganhou #{pontos_ate_agora} pontos."
end

nome = da_boas_vindas
palavra_secreta = escolhe_palavra_secreta

# loop "infinito" ate atender a condição para sair
loop do
    # equivalente a joga(nome)
    # chamada de função com passagem de parametro
    joga nome
    
    if nao_quer_jogar?
        break
    end
end
