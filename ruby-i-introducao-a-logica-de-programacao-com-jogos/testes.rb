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