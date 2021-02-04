# nil = null no ruby

def da_boas_vindas
    puts "Bem vindo ao Foge-Foge"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}"

    nome
end


def desenha(mapa)
    puts mapa
end


def pede_movimento
    puts "Para onde deseja ir?"
    #recebe o movimento digitado pelo usuário no terminal
    movimento = gets.strip
end