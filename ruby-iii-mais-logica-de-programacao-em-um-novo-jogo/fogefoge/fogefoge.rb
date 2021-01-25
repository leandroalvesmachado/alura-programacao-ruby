require_relative 'ui'


def le_mapa(numero)
    # lendo um arquivo
    arquivo = "mapa#{numero}.txt"
    texto = File.read arquivo
    mapa = texto.split "\n"
end


def encontra_jogador(mapa)
    caractere_do_heroi = "H"
    for linha in 0..(mapa.size - 1)
        linha_atual = mapa[linha]
        for coluna in 0..(linha_atual.size - 1)
            heroi_esta_aqui = linha_atual[coluna] == caractere_do_heroi
            if heroi_esta_aqui
            end
        end
    end
end


def joga(nome)
    # equivalente a mapa = le_mapa(1)
    mapa = le_mapa 1

    while true
        # equivalente a desenha(mapa)
        desenha mapa
        direcao = pede_movimento
    end
end


def inicia_fogefoge
    nome = da_boas_vindas
    joga nome
end