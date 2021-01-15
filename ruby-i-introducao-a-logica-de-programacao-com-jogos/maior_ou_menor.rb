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
    nome = gets

    puts
    puts
    puts
    # concatenando
    # não precisou converter o nome para string, pois já recebe uma string digitada pelo usuario
    puts "Começaremos o jogo para você, " + nome
end


# função
def sorteia_numero_secreto
    puts "Escolhendo um número secreto entre 0 e 200..."
    # escopo da variavel numero_secreto, escopo local
    # cuidado em definir uma variável com escopo global, qualquer lugar ela pode ser alterada
    # pode ser acessada por qualquer indivíduo com o código
    # o melhor é sempre encapsular da melhor forma
    sorteado = 175
    puts "Escolhido... que tal adivinhar hoje nosso número secreto?"

    # toda função ruby retorna a ultima instrução da função por padrão
    sorteado
    # ou
    # return sorteado
end


# função
def pede_um_numero(tentativa, limite_de_tentativas)
    # 3 quebras de linha
    puts "\n\n\n"
    #to_s = convertendo para string
    puts "Tentativa " + tentativa.to_s + " de " + limite_de_tentativas.to_s
    puts "Entre com o número"
    chute = gets
    puts "Será que acertou? Você chutou " + chute

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

limite_de_tentativas = 5

# executando qtd limite_de_tentativas
for tentativa in 1..limite_de_tentativas
    # chute = pede_um_numero(tentativa, limite_de_tentativas)
    # ou
    chute = pede_um_numero tentativa, limite_de_tentativas

    # invocando a função verifica_se_acertou
    # if verifica_se_acertou(numero_secreto, chute)
    #     break
    # end
    # ou
    break if verifica_se_acertou numero_secreto, chute
end