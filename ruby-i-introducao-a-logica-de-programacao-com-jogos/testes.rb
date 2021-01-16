# return true
puts 175 == 175

# return false
puts 175 == 174

# return false, string != inteiro
puts "175" == 175

# return true, string == string
puts "175" == "175"

# return true, convertendo string para integer
puts "175".to_i == 175

# return true
puts 175 != 174

# return false
puts 175 != 175

# return true
puts 175 > 174

# return true
puts 175 >= 175

# return true
puts 175 < 176

# return true
puts 175 <= 175

# outra forma de comentar, pouco usada
=begin
    comentario de varias
    linhas
=end

# laço for
# dedos.to_s = convertendo para string
for dedos in 1..3
    puts "Contando " + dedos.to_s
end

# criando array
chutes = [176, 100, 130, 150, 175]

# imprime todo o array
# 176
# 100
# 130
# 150
# 175
# 176
puts chutes

# imprimindo posicao 0 do array, começa da posição 0
puts chutes[0]

# insere um valor na ultima posição do array
chutes << 300

# tamanho do array
puts chutes.size

# iterando sobre todo o array
for chute in chutes
    puts chute
end

# imprime a qtd de caracteres do nome Leandro
# 7 caracteres
# Obs: gets adiciona um caractere a mais, devido a quebra de linha \n
# nome = gets.strip (remove os caracteres em branco do inicio e do fim da string)
nome = "Leandro"
puts nome.size.to_s + " caracteres"

# outra forma de imprimir a variavel sem usar o + para a concatenação e tb executa a conversão automatica para string (to_s)
# dessa forma não necessita escrever nome.to_s (já executa implicitamente)
puts "#{nome}"
puts "#{nome} tem #{nome.size} caracteres"

# interpretador do ruby, chamasse irb, comandos pelo terminal
# para descobrir os metodos que existem para um string. 
# Ex: nome = "Leandro" (cria a variavel), em seguida nome.methods (lista todos os metodos que uma variavel do tipo string possui)