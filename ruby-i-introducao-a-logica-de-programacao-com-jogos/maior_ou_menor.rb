# função
def da_boas_vindas
    # imprimindo
    # ruby é uma linguagem interpretada, mas pode ser compilada tb
    # puts ("Bem vindo ao jogo da adivinhação") tambem funciona
    puts "Bem vindo ao jogo da adivinhação"
    puts "Qual é o seu nome?"

    # captura o valor digitado no terminal e atribui a variavel nome
    # outra forma de captura o valor já com o puts
    # puts "Qual é o seu nome?" + gets
    # strip remove os caracteres em branco do inicio e do fim da string
    nome = gets.strip

    puts
    puts
    puts
    # concatenando
    # não precisou converter o nome para string, pois já recebe uma string digitada pelo usuario
    puts "Começaremos o jogo para você, #{nome}"
end


# função
def sorteia_numero_secreto
    puts "Escolhendo um número secreto entre 0 e 200..."
    # escopo da variavel numero_secreto, escopo local
    # cuidado em definir uma variável com escopo global, qualquer lugar ela pode ser alterada
    # pode ser acessada por qualquer indivíduo com o código
    # o melhor é sempre encapsular da melhor forma
    # sorteado = 175

    # gera um numero aletorio, entre 0 ate 200 
    sorteado = rand(200)
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


# invocando a função da_boas_vindas
da_boas_vindas

# invocando a função sorteia_numero_secreto
# numero_secreto guardando o retorno da função
numero_secreto = sorteia_numero_secreto

pontos_ate_agora = 1000
limite_de_tentativas = 5
chutes = []

# executando qtd limite_de_tentativas
for tentativa in 1..limite_de_tentativas
    # chute = pede_um_numero(tentativa, limite_de_tentativas)
    # ou
    chute = pede_um_numero chutes, tentativa, limite_de_tentativas

    # insere um valor na ultima posição do array
    chutes << chute

    # quando se usa algum numero com casa decimais (ponto flutuante), o retorno é um numero de ponto flutuante (float)
    # quando a conta é realizada entre números inteiros, apenas retorna a parte inteira do resultado, mesmo que o resultado seja um float
    # abs retorna o número absoluto (sempre positivo). Ex: -2 = 2, +2 = 2
    pontos_a_perder = (chute - numero_secreto).abs / 2.0
    
    # pontos_ate_agora = pontos_ate_agora - pontos_a_perder
    # ou
    pontos_ate_agora -= pontos_a_perder

    # invocando a função verifica_se_acertou
    # if verifica_se_acertou(numero_secreto, chute)
    #     break
    # end
    # ou
    break if verifica_se_acertou numero_secreto, chute
end

puts "Você ganhou #{pontos_ate_agora} pontos."