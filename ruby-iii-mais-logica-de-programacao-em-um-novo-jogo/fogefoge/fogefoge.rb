require_relative 'ui'


def le_mapa(numero)
    # lendo um arquivo
    arquivo = "mapa#{numero}.txt"
    texto = File.read arquivo
    mapa = texto.split "\n"
end


def encontra_jogador(mapa)
    caractere_do_heroi = "H"
    
    # for linha in 0..(mapa.size - 1)
    #     linha_atual = mapa[linha]
    #     coluna_do_heroi = lina_atual.index caractere_do_heroi
    #     if coluna_do_heroi
    #     end
    # end

    # outra forma de loop com os indices
    mapa.each_with_index do |linha_atual, linha_indice|
        coluna_do_heroi = linha_atual.index caractere_do_heroi
        if coluna_do_heroi
            return [linha_indice, coluna_do_heroi]
        end
    end
end


def calcula_nova_posicao(heroi, direcao)
    heroi = heroi.dup
    
    # case direcao
    #     when "W"
    #         heroi[0] -= 1
    #     when "S"
    #         heroi[0] += 1
    #     when "A"
    #         heroi[1] -= 1
    #     when "D"
    #         heroi[1] += 1
    # end

    # otimizando o codigo
    # usando chaves ({) para array associativo
    movimentos = {
        "W" => [-1, 0],
        "S" => [+1, 0],
        "A" => [0, -1],
        "D" => [0, +1]
    }

    movimento = movimentos[direcao]
    heroi[0] += movimento[0]
    heroi[1] += movimento[1]

    # return heroi
    heroi
end


# quando o retorno é true ou false usar interrogação
def posicao_valida?(mapa, posicao)
    linhas = mapa.size
    colunas = mapa[0].size
    # comparacao que retorna true ou false
    estourou_linhas = posicao[0] < 0 || posicao[0] >= linhas
    estourou_colunas = posicao[1] < 0 || posicao[1] >= colunas

    if estourou_linhas || estourou_colunas
        return false
    end

    valor_atual = mapa[posicao[0]][posicao[1]]
    if valor_atual == "X" || valor_atual == "F"
        return false
    end

    # return true
    true
end


def posicoes_validas_a_partir_de(mapa, posicao)
    posicoes = []
    baixo = [posicao[0] + 1, posicao[1]]
    direita = [posicao[0], posicao[1] + 1]
    cima = [posicao[0] - 1, posicao[1]]
    esquerda = [posicao[0], posicao[1] - 1]

    posicoes
end


def move_fantasma(mapa, linha, coluna)
    puts "Movendo o fantasma da posição #{linha} #{coluna}"
    posicoes = posicoes_validas_a_partir_de mapa, [linha, coluna]

    # outra forma return if posicoes.empty?
    if posicoes.empty?
        return
    end

    posicao = posicoes[0]
    mapa[linha][coluna] = " "
    mapa[posicao[0]][posicao[1]] = "F"
end

def move_fantasmas(mapa)
    caractere_do_fantasma = "F"

    mapa.each_with_index do |linha_atual, linha|
        # linha_atual.chars = transforma uma string em um array de caracteres
        linha_atual.chars.each_with_index do |caractere_atual, coluna|
            he_fantasma = caractere_atual == caractere_do_fantasma
            if he_fantasma
                move_fantasma mapa, linha, coluna
            end
        end
    end
end

def joga(nome)
    # equivalente a mapa = le_mapa(1)
    mapa = le_mapa 2

    while true
        # equivalente a desenha(mapa)
        desenha mapa
        direcao = pede_movimento
        heroi = encontra_jogador mapa
        nova_posicao = calcula_nova_posicao heroi, direcao

        if !posicao_valida? mapa, nova_posicao
            next
        end

        mapa[heroi[0]][heroi[1]] = " "
        mapa[nova_posicao[0]][nova_posicao[1]] = "H"
        move_fantasmas mapa
    end
end


def inicia_fogefoge
    nome = da_boas_vindas
    joga nome
end