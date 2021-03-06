# importando arquivo do mesmo diretorio (require_relative) ui.rb, não precisa da extensão
require_relative 'ui'
require_relative 'rank'


def escolhe_palavra_secreta
    avisa_escolhendo_palavra

    # lendo arquivo de texto
    texto = File.read("dicionario.txt")
    # quebrando o texto a cada \n (quebra de linha)
    todas_as_palavras = texto.split "\n"
    numero_escolhido = rand(todas_as_palavras.size)
    # downcase = transforma tudo em minusculo
    palavra_secreta = todas_as_palavras[numero_escolhido].downcase
    avisa_palavra_escolhida palavra_secreta
    
    # equivalente a return palavra_secreta
    palavra_secreta
end


def escolhe_palavra_secreta_sem_consumir_muita_memoria
    avisa_escolhendo_palavra

    # outra forma de ler um arquivo
    # lendo apenas as linhas necessarias
    arquivo = File.new("dicionario.txt")
    # gets = ler a primeira linha do arquivo
    quantidade_de_palavras = arquivo.gets.to_i
    numero_escolhido = rand(quantidade_de_palavras)
    for linha in 1..(numero_escolhido - 1)
        arquivo.gets
    end

    # downcase = transforma tudo em minusculo
    palavra_secreta = arquivo.gets.strip.downcase
    arquivo.close

    avisa_palavra_escolhida palavra_secreta
end



def palavra_mascarada(chutes, palavra_secreta)
    mascara = ""

    # chars = retorna uma array de caracteres a partir de uma string
    for letra in palavra_secreta.chars
        if chutes.include? letra
            mascara << letra
        else
            mascara << "_"
        end
    end

    mascara
end


def pede_um_chute_valido chutes, erros, mascara
    cabecalho_de_tentativa chutes, erros, mascara
    loop do
        chute = pede_um_chute
        # verificando se o chute ja existe no array chutes
        if chutes.include? chute
            # puts "Voê já chutou  #{chute}"
            # agora usando função do ui.rb
            avisa_chute_efetuado chute
        else
            return chute
        end
    end
end

def joga(nome)
    palavra_secreta = escolhe_palavra_secreta
    # palavra_secreta = escolhe_palavra_secreta_sem_consumir_muita_memoria

    erros = 0
    chutes = []
    pontos_ate_agora = 0

    while erros < 5
        mascara = palavra_mascarada chutes, palavra_secreta
        # equivalente a chute = pede_chute_valido(chutes, erros)
        chute = pede_um_chute_valido chutes, erros, mascara
        chutes << chute    

        chutou_uma_letra = chute.size == 1
        if chutou_uma_letra
            letra_procurada = chute[0]
            
            # usando o função conta
            # total_encontrado = conta palavra_secreta, letra_procurada
            # ruby ja possui uma função que conta as repetições de uma letra na string
            total_encontrado = palavra_secreta.count letra_procurada

            if total_encontrado == 0
                avisa_letra_nao_encontrada
                erros += 1
            else
                avisa_letra_encontrada total_encontrado
            end
        else
            acertou = chute == palavra_secreta
            if acertou
                avisa_acertou_palavra
                pontos_ate_agora += 100
                break
            else
                avisa_errou_palavra
                pontos_ate_agora -= 30
                erros += 1
            end
        end
    end

    avisa_pontos pontos_ate_agora
    pontos_ate_agora
end

def jogo_da_forca
    nome = da_boas_vindas
    pontos_totais = 0
    avisa_campeao_atual le_rank
    
    # loop "infinito" ate atender a condição para sair
    loop do
        # equivalente a joga(nome)
        # chamada de função com passagem de parametro
        pontos_totais += joga nome
        avisa_pontos_totais pontos_totais

        if le_rank[1].to_i < pontos_totais
            salva_rank nome, pontos_totais
        end
        
        if nao_quer_jogar?
            break
        end
    end
end
