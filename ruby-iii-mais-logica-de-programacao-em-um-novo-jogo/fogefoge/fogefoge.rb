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
    case direcao
        when "W"
            heroi[0] -= 1
        when "S"
            heroi[0] += 1
        when "A"
            heroi[1] -= 1
        when "D"
            heroi[1] += 1
    end

    heroi
end


# quando o retorno é true ou false usar interrogação
def posicao_valida?(mapa, posicao)
    linhas = mapa.size
    colunas = mapa[0].size
    estourou_linhas = posicao[0] < 0 || posicao[0] >= linhas
    estourou_colunas = posicao[1] < 0 || posicao[1] >= colunas

    if estourou_linhas || estourou_colunas
        return false
    end

    if mapa[posicao[0]][posicao[1]] == "X"
        return false
    end

    # return true
    true
end


def joga(nome)
    # equivalente a mapa = le_mapa(1)
    mapa = le_mapa 1

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
    end
end


def inicia_fogefoge
    nome = da_boas_vindas
    joga nome
end