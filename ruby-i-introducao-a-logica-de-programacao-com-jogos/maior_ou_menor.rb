# função
def da_boas_vindas
    # imprimindo
    # ruby é uma linguagem interpretada, mas pode ser compilada tb
    # puts ("Bem vindo ao jogo da adivinhação") tambem funciona
    # puts "Bem vindo ao jogo da adivinhação"
    puts
    puts "        P  /_\  P                              "
    puts "       /_\_|_|_/_\                             "
    puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
    puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
    puts "  |' '  |  |_|  |'  ' |                        "
    puts "  |_____| ' _ ' |_____|                        " 
    puts "        \__|_|__/                              "
    puts
    puts "Qual é o seu nome?"

    # captura o valor digitado no terminal e atribui a variavel nome
    # outra forma de captura o valor já com o puts
    # puts "Qual é o seu nome?" + gets
    # strip remove os caracteres em branco do inicio e do fim da string
    nome = gets.strip

    # puts
    # puts
    # puts
    puts "\n\n\n\n\n\n"
    # concatenando
    # não precisou converter o nome para string, pois já recebe uma string digitada pelo usuario
    puts "Começaremos o jogo para você, #{nome}"

    # return nome
    # ou
    nome
end


def pede_dificuldade
    puts "Qual o nível de dificuldade?"
    puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível"
    puts "Escolha: "
    # recebendo string digitada pelo usuário e convertendo para inteiro
    dificuldade = gets.to_i
end


# função
def sorteia_numero_secreto(dificuldade)
    # escopo da variavel numero_secreto, escopo local
    # cuidado em definir uma variável com escopo global, qualquer lugar ela pode ser alterada
    # pode ser acessada por qualquer indivíduo com o código
    # o melhor é sempre encapsular da melhor forma
    # sorteado = 175
    # no ruby uma variavel definida dentro de um if, else, switch, etc, ela é visivel em todo o metodo ou função, diferente do java digamos

    case dificuldade
    when 1
        maximo = 30
    when 2
        maximo = 60
    when 3
        maximo = 100
    when 4
        maximo = 150
    else
        maximo = 200
    end

    puts "Escolhendo um número secreto entre 1 e #{maximo}"
    # gera um numero aletorio, entre 0 ate 200 
    sorteado = rand(maximo) + 1
    puts "Escolhido... que tal adivinhar hoje nosso número secreto?"

    # toda função ruby retorna a ultima instrução da função por padrão
    sorteado
    # ou
    # return sorteado
end


# função
def pede_um_numero(chutes, tentativa, limite_de_tentativas)
    # 3 quebras de linha
    puts "\n\n\n"
    #to_s = convertendo para string
    # dessa forma não necessita escrever variavel.to_s (já executa implicitamente)
    puts "Tentativa #{tentativa} de #{limite_de_tentativas}"
    # funciona array to string
    puts "Chutes até agora: #{chutes}"
    puts "Entre com o número"
    # strip remove os caracteres em branco do inicio e do fim da string
    chute = gets.strip
    puts "Será que acertou? Você chutou #{chute}"

    # to_i converter para inteiro
    chute.to_i
    # ou
    # return chute.to_i
end

def ganhou
    puts
    puts "             OOOOOOOOOOO               "
    puts "         OOOOOOOOOOOOOOOOOOO           "
    puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
    puts "    OOOOOO      OOOOO      OOOOOO      "
    puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
    puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
    puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
    puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
    puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
    puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
    puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
    puts "         OOOOOO         OOOOOO         "
    puts "             OOOOOOOOOOOO              "
    puts
    puts "               Acertou!                "
    puts
end


# função
def verifica_se_acertou(numero_secreto, chute)
    # return true ou false, compara o numero_secreto com o chute
    acertou = numero_secreto == chute

    if acertou
        puts "Acertou!"
        return true
    end
    
    #return true ou false
    maior = numero_secreto > chute
    if maior
        puts "O número secreto é maior!"
    else
        puts "O número secreto é menor!"
    end

    # return false
    # ou
    false
end

def joga(nome, dificuldade)
    # ou numero_secreto = sorteia_numero_secreto(dificuldade)
	numero_secreto = sorteia_numero_secreto dificuldade

	limite_de_tentativas = 5
	chutes = []
	pontos_ate_agora = 1000

    # executando qtd limite_de_tentativas
    for tentativa in 1..limite_de_tentativas
        # ou chute = pede_um_numero(chutes, tentativa, limite_de_tentativas)
        chute = pede_um_numero chutes, tentativa, limite_de_tentativas
        
        # insere um valor na ultima posição do array
		chutes << chute

		if nome == "Leandro"
			ganhou
			break
		end

        # quando se usa algum numero com casa decimais (ponto flutuante), o retorno é um numero de ponto flutuante (float)
        # quando a conta é realizada entre números inteiros, apenas retorna a parte inteira do resultado, mesmo que o resultado seja um float
        # abs retorna o número absoluto (sempre positivo). Ex: -2 = 2, +2 = 2
        pontos_a_perder = (chute - numero_secreto).abs / 2.0
        
        # pontos_ate_agora = pontos_ate_agora - pontos_a_perder
        # ou
        pontos_ate_agora = pontos_ate_agora - pontos_a_perder
        
        # break if verifica_se_acertou numero_secreto, chute
        # ou
        # if verifica_se_acertou(numero_secreto, chute)
		if verifica_se_acertou numero_secreto, chute
			break
		end
	end

	puts "Você ganhou #{pontos_ate_agora} pontos."
end

def nao_quer_jogar?
	puts "Deseja jogar novamente? (S/N)"
	quero_jogar = gets.strip
	nao_quero_jogar = quero_jogar.upcase == "N"
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

# loop infinito, ate a condição de sair ser escolhida
loop do
    joga nome, dificuldade
    # o ? é usado quando geralmente se esta fazendo uma pergunta, para ficar mais claro que é uma pergunta para o programador
    # tb quando o metodo ou função é uma pergunta
	break if nao_quer_jogar?
end


# # invocando a função da_boas_vindas
# nome = da_boas_vindas

# # função que pergunta a dificuldade
# dificuldade = pede_dificuldade

# # invocando a função sorteia_numero_secreto
# # numero_secreto guardando o retorno da função
# # numero_secreto = sorteia_numero_secreto(dificuldade)
# numero_secreto = sorteia_numero_secreto dificuldade

# pontos_ate_agora = 1000
# limite_de_tentativas = 5
# chutes = []

# # executando qtd limite_de_tentativas
# for tentativa in 1..limite_de_tentativas
#     # chute = pede_um_numero(tentativa, limite_de_tentativas)
#     # ou
#     chute = pede_um_numero chutes, tentativa, limite_de_tentativas

#     # insere um valor na ultima posição do array
#     chutes << chute

#     # quando se usa algum numero com casa decimais (ponto flutuante), o retorno é um numero de ponto flutuante (float)
#     # quando a conta é realizada entre números inteiros, apenas retorna a parte inteira do resultado, mesmo que o resultado seja um float
#     # abs retorna o número absoluto (sempre positivo). Ex: -2 = 2, +2 = 2
#     pontos_a_perder = (chute - numero_secreto).abs / 2.0
    
#     # pontos_ate_agora = pontos_ate_agora - pontos_a_perder
#     # ou
#     pontos_ate_agora -= pontos_a_perder

#     # invocando a função verifica_se_acertou
#     # if verifica_se_acertou(numero_secreto, chute)
#     #     break
#     # end
#     # ou
#     break if verifica_se_acertou numero_secreto, chute
# end

# def quer_jogar(nome, dificuldade)
#     pus "Deseja jogar novamente? (S/N)"
#     quero_jogar = gets.strip

#     # retorna true ou false
#     # return quero_jogar == "S"
#     # ou mesma coisa
#     # upcase texto em maiuscula
#     quero_jogar.upcase == "S"
# end

# def joga(nome, dificuldade)
# end

# puts "Você ganhou #{pontos_ate_agora} pontos."